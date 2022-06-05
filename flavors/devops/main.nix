{ config, pkgs, ... }:
{
  imports = [
    ./ops/nix.nix
    ./ops/cloud.nix
    ./ops/kube.nix
    ./ops/ops.nix
    ./ops/sops.nix
    ./ops/docker.nix
    ./dev/python.nix
    ./dev/golang.nix
    ./dev/java.nix
    ./dev/nodejs.nix
    ./dev/ruby.nix
    ./dev/groovy.nix
  ];
}
