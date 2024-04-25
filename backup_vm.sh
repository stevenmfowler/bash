#!/bin/bash

# Set a default backup directory (modify as needed)
BACKUP_DIR="$HOME/backups/vms"

# Prompt for the name of the VM
read -p "Enter the name of the virtual machine: " VM_NAME

# Check if the VM exists
if ! vboxmanage showvminfo "$VM_NAME" > /dev/null 2>&1; then
  echo "Error: Virtual machine '$VM_NAME' not found."
  exit 1
fi

# Get the path to the VDI file for the VM
VDI_PATH=$(vboxmanage showvminfo "$VM_NAME" | grep "Hard Disks" | awk '{print $NF}')

# Check if the VDI file exists
if [ ! -f "$VDI_PATH" ]; then
  echo "Error: VDI file for '$VM_NAME' not found."
  exit 1
fi

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Generate a timestamp for the backup filename
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

# Create the backup filename with timestamp
BACKUP_FILE="$BACKUP_DIR/$VM_NAME-$TIMESTAMP.vdi"

# Backup the VDI file
echo "Backing up '$VM_NAME' VDI to '$BACKUP_FILE'..."
cp "$VDI_PATH" "$BACKUP_FILE"

if [ $? -eq 0 ]; then
  echo "Backup completed successfully."
else
  echo "Error: Backup failed."
  exit 1
fi

