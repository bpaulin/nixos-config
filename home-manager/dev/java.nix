{ pkgs, ... }:
{

  home.packages = with pkgs; [
    maven
    jdk
  ];
}
