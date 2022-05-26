{ config, pkgs, ... }:

{
  home.username = "bpaulin";
  home.homeDirectory = "/home/bpaulin";

  home.stateVersion = "21.11";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./tty/git.nix
    ./tty/shell.nix
    ./tty/ssh.nix
    ./tty/fun.nix
    ./display/gnome.nix
    ./display/chrome.nix
    ./display/terminator.nix
    ./display/vscode.nix
    ./ops/nix.nix
    ./ops/cloud.nix
    ./ops/kube.nix
    ./ops/ops.nix
    ./dev/python.nix
    ./dev/golang.nix
    ./dev/java.nix
    ./dev/ruby.nix
    ./work/network.nix
    ./work/onepromo.nix
  ];
}
