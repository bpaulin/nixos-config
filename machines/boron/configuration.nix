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
    <nixos-hardware/common/gpu/nvidia.nix>
    <nixos-hardware/common/gpu/nvidia-disable.nix>
  ];

  services.thermald.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  home-manager.users.bpaulin = { ... }: {
    id_pub = {
      bpaulin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIcmR6S6hpKRX8mTrNtfexDOAmO1FTb93Hxo6ne3clXB bpaulin@boron ";
      oneup = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBIpyRf1jY2f4fWQvJFYC98MX/LwbSWu8zBs+0iwEPQN oneup@boron";
    };
  };
  hardware.nvidia.prime = {
    # offload.enable = lib.mkDefault true;
    # Hardware should specify the bus ID for intel/nvidia devicesi
    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";
  };
}

