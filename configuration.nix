{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.05";

  imports =
    [
      ##
      # Nixos config
      ##
      # Per machine config
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix
      # Home manager module
      <home-manager/nixos>

      ##
      # Variables
      ##
      # Secrets decrypted
      ./variables/secrets.nix
      # Flags to enable/disable features (not used yet)
      ./variables/flags.nix

      ##
      # Modules
      ##

      # System config
      ./modules/system/networkmanager.nix
      ./modules/system/locale.nix
      ./modules/system/user.nix
      ./modules/system/fwupd.nix

      # Home settings and connections
      ./modules/home

      # Work settings and connections
      ./modules/work

      # Shell config
      ./modules/shell/fun.nix
      ./modules/shell/gh.nix
      ./modules/shell/git.nix
      ./modules/shell/shell.nix
      ./modules/shell/ssh.nix
      ./modules/shell/vim.nix

      # Display config
      ./modules/display/manager.nix
      ./modules/display/gnome
      # ./modules/display/sway
      ./modules/display/common/browser.nix
      ./modules/display/common/terminal.nix
      ./modules/display/common/vscode.nix

      # Development tools
      ./modules/dev/nodejs.nix
      ./modules/dev/groovy.nix
      ./modules/dev/golang.nix
      ./modules/dev/python.nix
      ./modules/dev/java.nix
      ./modules/dev/rust.nix

      # Ops tools
      ./modules/ops/terraform.nix
      ./modules/ops/libvirt.nix
      ./modules/ops/cloud.nix
      ./modules/ops/sops.nix
      ./modules/ops/vault.nix
      ./modules/ops/kube.nix
      ./modules/ops/editorconfig.nix
      ./modules/ops/nix.nix
      ./modules/ops/docker.nix
      ./modules/ops/ansible.nix

      # Medias
      ./modules/medias/image.nix

      # Impermanence
      ./modules/impermanence/module.nix
      ./modules/impermanence/config.nix

      # Server
      ./modules/server/k3s.nix

      # Not classified yet...
      ./modules/mess.nix
    ];
}

