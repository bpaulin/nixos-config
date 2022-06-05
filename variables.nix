{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    settings = mkOption {
      type = types.attrs;
    };
  };

  config = {
    settings = (lib.trivial.importJSON ./secrets.json);
  };
}
