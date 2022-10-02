{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    flags = {
      forWork = mkOption {
        type = types.bool;
        default = true;
      };
      forGames = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = { };
}
