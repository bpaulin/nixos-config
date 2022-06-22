# Impermanence basic config
{ pkgs, lib, ... }:

let
  impermanence = builtins.fetchTarball {
    url =
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
  };

in
{
  imports = [
    "${impermanence}/nixos.nix"
  ];

  programs.fuse.userAllowOther = true;

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [ ];
    files = [ ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    imports = [ "${impermanence}/home-manager.nix" ];
    home.persistence."/nix/persist/home" = {
      directories = [ ];
      files = [ ];
      allowOther = true;
    };
  };
}

