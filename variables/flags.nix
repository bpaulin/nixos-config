{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    flags = {
      impermanence = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = { };
}
