{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      ##
      # Nixos config
      ##
      # Per machine config
      ./machines/lithium/hardware-configuration.nix
      ./machines/lithium/configuration.nix
      # Home manager module
      # <home-manager/nixos>

      ##
      # Variables
      ##
      # Secrets decrypted
      ./variables/secrets.nix
      # Flags to enable/disable features (not used yet)
      ./variables/flags.nix

      ##
      # Modules
      ##

      # common config
      ./modules/common
    ];
}

