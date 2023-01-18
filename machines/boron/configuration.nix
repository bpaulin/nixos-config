{ pkgs, ... }:

{
  networking.hostName = "boron";

  imports = [
    ./../../modules/laptops
    ./../../modules/work
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/pc/laptop>
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/intel.nix>
    <nixos-hardware/common/gpu/nvidia>
    <nixos-hardware/common/gpu/nvidia/prime.nix>
    # <nixos-hardware/common/gpu/nvidia/disable.nix>
  ];

  services.thermald.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi"; # why?

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-be88c213-2621-464e-8a95-9a0bfc693603".device = "/dev/disk/by-uuid/be88c213-2621-464e-8a95-9a0bfc693603";
  boot.initrd.luks.devices."luks-be88c213-2621-464e-8a95-9a0bfc693603".keyFile = "/crypto_keyfile.bin";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  home-manager.users.bpaulin = { ... }: {
    id_pub = {
      bpaulin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAKJV5Cl4HA7wlZPtkVLsU9LuIRJ+5B13bucTvmSxPlh bpaulin@boron";
      oneup = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINLZ5gmGeAlOC/NZQ9sSD8kvZTcOqkE79c2t2xL20VTI oneup@boron";
    };
  };
  hardware.nvidia = {
    prime = {
      # offload.enable = lib.mkDefault true;
      # Hardware should specify the bus ID for intel/nvidia devicesi
      # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
      intelBusId = "PCI:0:2:0";

      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";
    };
    powerManagement = {
      enable = true;
      finegrained = true;
    };
  };
}

