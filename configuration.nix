{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.05";

  imports =
    [
      ##
      # Nixos config
      ##
      # Per machine config
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix
      # Home manager module
      <home-manager/nixos>
      # no need for secrets for now
      # <agenix/modules/age.nix>

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

