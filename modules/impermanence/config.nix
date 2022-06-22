# Impermanence files and dirs config, if enabled
{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.impermanence) {
  environment.persistence."/nix/persist" = {
    directories = [ ];
    files = [ ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.persistence."/nix/persist/home/bpaulin" = {
      directories = [ ];
      files = [
        ".test_impermanence"
      ];
    };
  };
}
