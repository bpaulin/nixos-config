# Impermanence files and dirs config, if enabled
{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.impermanence) {
  environment.persistence."/nix/persist" = {
    directories = [ ];
    files = [ ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.persistence."/nix/persist/home/bpaulin" = {
      directories = [
        ".config/gcloud"
      ];
      files = [
        ".test_impermanence"
        ".config/gh/hosts.yml"
      ];
    };
  };
}
