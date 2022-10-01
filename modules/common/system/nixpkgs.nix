{ pkgs, ... }:
{
  # nixpkgs configuration
  nixpkgs.overlays = [
    # to add packages not yet in nixpkgs
    (import ../../../pkgs/nixpkgs)
    # to add packages specific to my uses
    (import ../../../pkgs/specific)
  ];

  # same package on system and hm
  home-manager.useGlobalPkgs = true;
}
