# My NixOs config

 > Don't use this! i'm not even using it on my main laptop (yet?)

## Install

```bash
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart primary 512MiB 100%
cryptsetup luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 enc-pv

pvcreate /dev/mapper/enc-pv
vgcreate vg /dev/mapper/enc-pv
lvcreate -L 8G -n swap vg
lvcreate -l '100%FREE' -n root vg

mkfs.fat /dev/sda1
mkfs.ext4 -L root /dev/vg/root
mkswap -L swap /dev/vg/swap

mount /dev/vg/root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/vg/swap
```

```
nix-env -i git envsubst
```

## memo

Set unstable channesl:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```

Set stable channesl:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
sudo nix-channel --update
```

Update config:

```bash
sudo nixos-rebuild switch
```

Upgrade config:

```bash
sudo nixos-rebuild switch --upgrade
```

Clean unused configs:

```bash
sudo nix-collect-garbage -d
```

List installed packages (must be a better way)

```
nix-store -q --references /var/run/current-system/sw | cut -d'-' -f2- | grep -v '\-man' | grep -v '\-doc' | grep -v '\-info' | sort > packages.txt
```
