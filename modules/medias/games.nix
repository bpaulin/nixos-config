{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.forGames) {
  programs.steam.enable = true;
}
