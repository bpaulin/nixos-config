##
# Useless things ... i want them everywhere
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # wise and/or funny qotes
      fortune
      # psych colors stdout
      lolcat
      # a cow (at best) syaing stdout
      cowsay
      # fishs on screen (i'm a dad)
      asciiquarium
      # train on screen (i'm still a dad)
      sl
      # ascii art stdout
      figlet
    ];
  };
}
