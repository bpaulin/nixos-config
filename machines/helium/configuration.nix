{ config, pkgs, ... }:

{
  networking.hostName = "helium";
  imports = [
    ./../../flavors/home
    ./../../flavors/display
    ./../../flavors/work
    ./../../flavors/devops
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

