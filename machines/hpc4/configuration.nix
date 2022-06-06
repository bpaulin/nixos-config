{ config, pkgs, ... }:

{
  networking.hostName = "hpc4";
  imports = [
    ./../../flavors/home/main.nix
    ./../../flavors/x/main.nix
    ./../../flavors/work/main.nix
    ./../../flavors/devops/main.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/893fda4d-6c46-481f-a052-50f2ab2fc2d7";
      preLVM = true;
      allowDiscards = true;
    };
  };
}

