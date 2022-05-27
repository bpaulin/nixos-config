{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.prettier
  ];
}
