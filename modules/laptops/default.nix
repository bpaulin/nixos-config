{ config, pkgs, ... }:
{
  imports =
    [

      # Home settings and connections
      ./home

      # Work settings and connections
      ./work

      # Games

      # Shell config
      ./shell/fun.nix
      ./shell/ssh.nix

      # Display config
      ./display/manager.nix
      ./display/gnome
      # ./display/sway
      ./display/common/browser.nix
      ./display/common/terminal.nix
      ./display/common/vscode.nix

      # Development tools
      ./dev/nodejs.nix
      ./dev/groovy.nix
      ./dev/golang.nix
      ./dev/python.nix
      ./dev/java.nix
      ./dev/rust.nix
      ./dev/julia.nix

      # Ops tools
      ./ops/terraform.nix
      ./ops/libvirt.nix
      ./ops/cloud.nix
      ./ops/sops.nix
      ./ops/vault.nix
      ./ops/kube.nix
      ./ops/nix.nix
      ./ops/docker.nix
      ./ops/ansible.nix
      ./ops/tilt.nix

      # Medias
      ./medias/image.nix
      ./medias/games.nix

      # Not classified yet...
      ./mess.nix
    ];
}

