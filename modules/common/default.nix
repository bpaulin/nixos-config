{ config, pkgs, ... }:
{
  imports = [
    # System config
    ./system/nixpkgs.nix
    ./system/networkmanager.nix
    ./system/locale.nix
    ./system/user.nix
    ./system/fwupd.nix
    # no need for secrets for now
    #./system/secrets.nix

    # Shell config
    ./shell/fun.nix
    ./shell/gh.nix
    ./shell/git.nix
    ./shell/shell.nix
    ./shell/ssh.nix
    ./shell/vim.nix

    # Ops config
    ./ops/kube.nix
    ./ops/nix.nix
  ];
}

