{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.isServer) {
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s = {
    enable = true;
    extraFlags = "--write-kubeconfig-mode 644";
  };
}
