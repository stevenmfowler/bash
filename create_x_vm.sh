#!/bin/bash

# Author: Steven Fowler (script creation and modifications)
# Updated: 2023.04.22

# Prompt for VM name
read -p "Enter the desired VM name: " VM_NAME

# Default download directory (current user's downloads)
DEFAULT_DOWNLOAD_DIR="$HOME/Downloads"

# Prompt for ISO path (with default suggestion)
read -p "Enter the path to the ISO (default: $DEFAULT_DOWNLOAD_DIR): " ISO_PATH

# If no path provided, use the default
if [[ -z "$ISO_PATH" ]]; then
  ISO_PATH="$DEFAULT_DOWNLOAD_DIR"
fi

# Check if ISO exists
if [ ! -f "$HOME/vms" ]; then
    mkdir $HOME/vms
fi

# Available RAM options (in MB) with increments of 2GB
RAM_OPTIONS=(500 1000 1500 2000)

# Available CPU options
CPU_OPTIONS=(1 2 3 4)

# Check if VirtualBox is installed
if ! which vboxmanage > /dev/null; then
  echo "Error: VirtualBox is not installed. Please install it first."
  exit 1
fi

# Check if ISO exists
if [ ! -f "$ISO_PATH/antiX-23.1_x64-full.iso" ]; then
  # ISO not found, prompt for download (default Yes)
  read -p "ISO not found at '$ISO_PATH'. Download it now? (y/N): " DOWNLOAD

  # Download if user confirms (or doesn't enter anything)
  if [[ "$DOWNLOAD" =~ ^[Yy] || $DOWNLOAD -eq "" ]]; then
    # Download logic (replace with your preferred download method)
    echo "Downloading Linux Mint..."
    # Download command using wget (replace the URL with the actual download link)
    wget http://www.gtlib.gatech.edu/pub/MX-Linux/MX-Linux/ANTIX/Final/antiX-23.1/antiX-23.1_x64-full.iso -O "$ISO_PATH/antiX-23.1_x64-full.iso"
    echo "ISO Download complete."
  fi
fi

# Prompt for CPU cores
echo "Select the number of CPU cores for the VM (1, 2, 3, or 4):"
select CPU in "${CPU_OPTIONS[@]}"; do
  if [[ -z "$CPU" ]]; then
    echo "Invalid selection. Please choose a valid option."
    continue
  fi
  break
done

# Prompt for RAM size
echo "Select the amount of RAM for the VM (500, 1000, 1500, or 2000 MB):"
select RAM in "${RAM_OPTIONS[@]}"; do
  if [[ -z "$RAM" ]]; then
    echo "Invalid selection. Please choose a valid option."
    continue
  fi
  break
done

# Create the VM
vboxmanage createvm --name "$VM_NAME" --ostype LinuxMint64 --register

# Set VM RAM
vboxmanage modifyvm "$VM_NAME" --cpus "$CPU" --memory "$RAM" --vram 50

# Set Network
VBoxManage modifyvm "$VM_NAME" --nic1 NAT

## DISK ##

# Create a virtual disk
VBoxManage createhd --filename $HOME/vms/$VM_NAME.vdi --size 40960

# Create SATA Controller and attache drive
VBoxManage storagectl "$VM_NAME" --name "SATA" --add sata --bootable on
VBoxManage storageattach "$VM_NAME" --storagectl "SATA" --port 0 --device 0 --type hdd --medium $HOME/vms/$VM_NAME.vdi

## CD ##
VBoxManage storagectl "$VM_NAME" --name "IDE" --add ide
VBoxManage storageattach "$VM_NAME" --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium "$ISO_PATH/antiX-23.1_x64-full.iso"

# Check if VDI file exists to indicate successful VM creation
VDI_FILE="$HOME/vms/$VM_NAME.vdi"
if [ ! -f "$VDI_FILE" ]; then
  echo "Error: Virtual Machine creation failed. VDI file '$VDI_FILE' not found."
  exit 1
fi

echo "Linux Mint VM '$VM_NAME' created successfully."

# Instructions on how to run the VM
echo "To run the '$VM_NAME' virtual machine:"
echo "1. VBoxManage startvm $VM_NAME"
