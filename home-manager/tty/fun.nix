{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fortune
    lolcat
    cowsay
    asciiquarium
    sl
    figlet
    terminal-parrot
  ];
}
