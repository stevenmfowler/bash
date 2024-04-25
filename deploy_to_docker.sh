#!/bin/bash

echo -e "This CLI assumes the following:"
echo -e "1) In the current project directory."
echo -e "2) virtual environment is activated."
echo -e "3) requirements.txt exists."

# Step 0: Updating the package index
echo -e "Step 0: Updating the package index"

sudo apt update -y
sudo apt upgrade -y
echo

# Prompting user for project name
read -p "Enter project name: " project_name
echo

# Creating Dockerfile
echo -e "Creating Dockerfile"
cat <<EOF > Dockerfile
FROM python:3.10.12-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./*" ]
EOF
echo

# Creating requirements.txt file
echo -e "Adding docker to requirements.txt file"
echo "docker" > requirements.txt
echo

# Adding current user to the docker group
echo -e "Adding current user to the docker group..."
sudo usermod -aG docker "$USER"
echo

# Building Docker image
echo -e "Building Docker image"
sudo docker build -t "$project_name" .
if [ $? -ne 0 ]; then
    echo -e "Failed to build Docker image. Exiting..."
    exit 1
fi
echo

# Verifying Docker image
echo -e "Verifying Docker image"
sudo docker images | grep "$project_name" > /dev/null
if [ $? -eq 0 ]; then
    echo -e "Docker image built successfully!"
else
    echo -e "Failed to build Docker image."
fi
echo

# Cleaning up
echo -e "Cleaning up"
rm requirements.txt
echo

# Creating provisioning script
echo -e "Creating provisioning script"
cat <<EOF > provision_detailed.sh
#!/bin/bash
# -p 80:80
docker run -d --name $project_name $project_name
EOF
chmod +x provision.sh
echo

# Creating provisioning script
echo -e "Creating provisioning script"
cat <<EOF > provision_attached.sh
#!/bin/bash

docker run -it --name $project_name $project_name /bin/bash
EOF
chmod +x provision.sh
echo

# Creating start script
echo -e "Creating start script"
cat <<EOF > start.sh
#!/bin/bash

docker start $project_name
EOF
chmod +x start.sh
echo

cd $project_name

echo -e "Project created successfully!"
