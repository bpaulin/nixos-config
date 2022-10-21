{ ... }:

{
  networking.hostName = "beryllium";

  imports = [
    ./../../modules/servers
    <nixos-hardware/common/pc/ssd>
    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/intel.nix>
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  home-manager.users.bpaulin = { ... }: {
    programs = {
      git = {
        extraConfig = {
          "commit" = {
            gpgSign = true;
          };
          user = {
            signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArE9LfMabG3bqYh1SFO6+nEr4c4wmzne+a/+ilG8O6P bpaulin@beryllium";
          };
        };
      };
    };
  };

}
