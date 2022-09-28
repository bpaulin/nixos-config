# Install on new laptop

## Prepare usb drive

```bash
# Download minimal iso
curl -L -O https://channels.nixos.org/nixos-22.05/latest-nixos-gnome-x86_64-linux.iso

# Print available drive
lsblk
# In this case, my usb drive is /dev/sdb

# Write image
sudo dd if=latest-nixos-gnome-x86_64-linux.iso of=/dev/sdb
```

... then reboot on usb drive

## File systems

```bash
##
# Partitions
##
# Create a new partition table
parted /dev/nvme0n1 -- mklabel gpt
# Create a uefi boot partition
parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme0n1 -- set 1 esp on
# Give everything else to a primary partition
parted /dev/nvme0n1 -- mkpart primary 512MiB 100%

##
# Encryption
##
# Crypt partition
cryptsetup luksFormat /dev/nvme0n1p2
# Open Partition
cryptsetup luksOpen /dev/nvme0n1p2 enc-pv

##
# LVM
##
# Create physical volume
pvcreate /dev/mapper/enc-pv
# Create volume group
vgcreate vg /dev/mapper/enc-pv
# Create Logical Volume for swap
lvcreate -L 8G -n swap vg
# Create Logical Volume for root
lvcreate -l '100%FREE' -n root vg

##
# Format
##
# Format boot (fat32)
mkfs.fat /dev/nvme0n1p1
# Format root (ext4)
mkfs.ext4 -L root /dev/vg/root
# Format swap
mkswap -L swap /dev/vg/swap

##
# Mount
##
# Mount root
mount /dev/vg/root /mnt
# Mount boot
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
# Use swap
swapon /dev/vg/swap
```

## Generate configuration

```bash
##
# Clone this repo
##
# Install tools
nix-env -iA nixos.git nixos.sops nixos.age
# Create config dir and clone this repo
mkdir -p /mnt/etc/nixos
cd /mnt/etc/nixos
git clone https://github.com/bpaulin/nixos-config .
# Set specific config (hydrogen is the machine name)
./setup.sh hydrogen
nixos-generate-config --root /mnt --dir machines/local
##

# Finally, install nixos
##
# Set channels
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update
# Install (repeat if network failure)
nixos-install --no-root-passwd
# Restart on fresh os
reboot
```

## After reboot

```bash
# Fix rights on configuration
sudo chown -R bpaulin:users /etc/nixos
# Set channels
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```
