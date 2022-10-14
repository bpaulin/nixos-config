{ config, pkgs, ... }:

{
  networking.hostName = "helium";

  imports = [
    ./../../modules/laptops
    ./../../modules/work/current
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/amd>
    <nixos-hardware/common/gpu/amd>
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

