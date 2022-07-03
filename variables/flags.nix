{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    flags = {
      impermanence = mkOption {
        type = types.bool;
        default = false;
      };
      forWork = mkOption {
        type = types.bool;
        default = true;
      };
      isServer = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = { };
}
