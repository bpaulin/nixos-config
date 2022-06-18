{ config, pkgs, ... }:

{
  networking.hostName = "hydrogen";
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
      device = "/dev/disk/by-uuid/dac31eae-6a2f-4b60-a4b9-625bb1e79fb0";
      preLVM = true;
      allowDiscards = true;
    };
  };
}

