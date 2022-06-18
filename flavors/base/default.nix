{ config, pkgs, ... }:
{
  imports = [
    ./tty/git.nix
    ./tty/gh.nix
    ./tty/shell.nix
    ./tty/ssh.nix
    ./tty/fun.nix
    ./tty/vim.nix
  ];
}
