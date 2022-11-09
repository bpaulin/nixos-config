{ ... }:
{
  # nixpkgs configuration
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      # to add packages not yet in nixpkgs
      (import ../../../pkgs/nixpkgs)
      # to add packages specific to my uses
      (import ../../../pkgs/specific)
    ];
  };

  # same package on system and hm
  home-manager.useGlobalPkgs = true;

  # auto clean
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
