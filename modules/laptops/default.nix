{ config, pkgs, ... }:
{
  imports =
    [
      # System config
      ./system/nixpkgs.nix
      ./system/networkmanager.nix
      ./system/locale.nix
      ./system/user.nix
      ./system/fwupd.nix

      # Home settings and connections
      ./home

      # Work settings and connections
      ./work

      # Games

      # Shell config
      ./shell/fun.nix
      ./shell/gh.nix
      ./shell/git.nix
      ./shell/shell.nix
      ./shell/ssh.nix
      ./shell/vim.nix

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

      # Server
      ./server/k3s.nix

      # Not classified yet...
      ./mess.nix
    ];
}

