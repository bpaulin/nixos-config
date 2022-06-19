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
      ./flavors/system/networkmanager.nix
      ./flavors/system/locale.nix
      ./flavors/system/user.nix

      # Home settings and connections
      ./flavors/home

      # Work settings and connections
      ./flavors/work

      # Shell config
      ./flavors/shell/fun.nix
      ./flavors/shell/gh.nix
      ./flavors/shell/git.nix
      ./flavors/shell/shell.nix
      ./flavors/shell/ssh.nix
      ./flavors/shell/vim.nix

      # Display config
      ./flavors/display/manager.nix
      ./flavors/display/gnome
      # ./flavors/display/sway
      ./flavors/display/common/browser.nix
      ./flavors/display/common/terminal.nix
      ./flavors/display/common/vscode.nix

      # Development tools
      ./flavors/dev/nodejs.nix
      ./flavors/dev/groovy.nix
      ./flavors/dev/ruby.nix
      ./flavors/dev/golang.nix
      ./flavors/dev/python.nix
      ./flavors/dev/java.nix

      # Ops tools
      ./flavors/ops/terraform.nix
      ./flavors/ops/libvirt.nix
      ./flavors/ops/cloud.nix
      ./flavors/ops/sops.nix
      ./flavors/ops/kube.nix
      ./flavors/ops/editorconfig.nix
      ./flavors/ops/nix.nix
      ./flavors/ops/docker.nix
      ./flavors/ops/ansible.nix

      # Not classified yet...
      ./flavors/mess.nix
    ];
}

