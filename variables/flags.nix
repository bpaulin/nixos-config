{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    flags = {
      forGames = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = { };
}
