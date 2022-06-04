{ config, pkgs, ... }:

{
  networking.hostName = "oldc4";
  imports = [
    ./../../flavors/x/main.nix
    ./../../flavors/work/main.nix
    ./../../flavors/devops/main.nix
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

