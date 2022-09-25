{ config, pkgs, lib, ... }:

with lib;

{
  options = {
    secrets-json = mkOption {
      type = types.attrs;
    };
  };

  config = {
    secrets-json = (lib.trivial.importJSON /etc/nixos/secrets.json);
  };
}
