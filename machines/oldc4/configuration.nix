{ config, pkgs, ... }:

{
  networking.hostName = "oldc4";

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

  console = {
    keyMap = "fr";
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.enable = true;
  services.xserver.layout = "fr";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}

