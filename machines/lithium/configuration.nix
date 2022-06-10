{ config, pkgs, ... }:

{
  networking.hostName = "lithium";
  imports = [
    ./../../flavors/home/main.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}

