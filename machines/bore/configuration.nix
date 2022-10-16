{ config, pkgs, ... }:

{
  networking.hostName = "bore";

  imports = [
    ./../../modules/laptops
    ./../../modules/work/next
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/intel.nix>
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/2f526857-4621-4e3d-a4cd-4268eda455b4";
      preLVM = true;
      allowDiscards = true;
    };
  };
}

