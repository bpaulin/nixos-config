{ pkgs, ... }:

{
  networking.hostName = "lithium";

  imports = [
    ./../../modules/laptops
    ./../../modules/games
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/intel.nix>
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/2f526857-4621-4e3d-a4cd-4268eda455b4";
      preLVM = true;
      allowDiscards = true;
    };
  };

  home-manager.users.bpaulin = { ... }: {
    id_pub = {
      bpaulin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/VsidDLXw+2KKToJfqgP9ka7FdYSnIhPGgNYrOhNzu bpaulin@lithium";
      # oneup = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJuRSdnnq+IFIDI6xi1vGQCZWBSvBoTOP9SQu/RkVo0l oneup@lithium";
    };
  };
}

