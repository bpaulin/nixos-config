{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    flags = mkOption {
      type = types.attrs;
    };
  };

  config = { };
}
