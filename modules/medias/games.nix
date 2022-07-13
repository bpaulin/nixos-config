{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.forGames) {
  programs.steam.enable = true;
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      ckan
    ];
  };
}
