{ config, pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    imports = [
      ./tty/git.nix
      ./tty/gh.nix
      ./tty/shell.nix
      ./tty/ssh.nix
      ./tty/fun.nix
    ];
  };
}
