{ config, pkgs, ... }:

{
  networking.hostName = "lithium";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  flags.forWork = false;
  flags.impermanence = false;
  # flags.isServer = true;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/2f526857-4621-4e3d-a4cd-4268eda455b4";
      preLVM = true;
      allowDiscards = true;
    };
  };
}

