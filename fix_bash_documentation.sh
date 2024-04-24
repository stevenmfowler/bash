#!/bin/bash

# Description: fix bash documentation

# Usage: create_x_vm.sh

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)

# Date: 2024-04-23

# Function to check and add documentation
check_and_add_doc() {
  local filename="$1"

  # Check if first non-empty line starts with shebang
  shebang_line=$(grep -m 1 '^#!' "$filename" || true)
  if [[ "$shebang_line" = "" ]]; then
    echo "Skipping '$filename': No shebang line found."
    return 1
  fi

  # Check for existing author line before processing
  if grep -q '# Author:' "$filename"; then
    echo "Skipping '$filename': Already Documented."
    return 1
  fi

  # Extract shebang line and remaining content
  shebang_line=$(head -n 1 "$filename")
  remaining_content=$(tail -n +2 "$filename")

  # Construct documentation content with proper indentation
  doc_content="
# Description:

# Usage: ${filename}

# Author: Steven Fowler (https://github.com/stevenmfowler)
# License: MIT (https://mit-license.org)
# Date: $(date +%Y-%m-%d)"

  # Combine shebang line, documentation, and remaining content
  new_content="$shebang_line
$doc_content
$remaining_content"

  # Write the modified content to the documented version in the same directory
  echo "$new_content" > "$filename"
  echo "Added documentation to a new file $filename"
}

# Loop through all files in current directory
for filename in *; do
  check_and_add_doc "$filename"
done

echo "Script execution complete."
