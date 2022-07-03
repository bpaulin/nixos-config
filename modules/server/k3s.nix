{ config, pkgs, lib, ... }:
lib.mkIf (config.flags.isServer) {
  services.k3s.enable = true;
}
