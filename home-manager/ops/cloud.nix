{ pkgs, ... }:
{
  home.packages = with pkgs; [
    azure-cli
    google-cloud-sdk
    aws
  ];
}
