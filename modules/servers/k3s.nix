{ config, pkgs, lib, ... }:

{
  networking.firewall.allowedTCPPorts = [
    # kube api
    6443
    # metric server
    10250
  ];
  services.k3s = {
    enable = true;
    extraFlags = "--write-kubeconfig-mode 644";
  };
}
