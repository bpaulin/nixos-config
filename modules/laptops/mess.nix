{ pkgs, ... }:
{
  nixpkgs.overlays = [
    # (import ../../pkgs/overlays/OVERLAY.nix)
  ];

  environment.systemPackages = with pkgs; [
    # packages
  ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # packages
    ];
  };
}
