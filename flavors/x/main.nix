{ config, pkgs, ... }:
{
  imports = [
    ./display/gnome.nix
    ./display/chrome.nix
    ./display/terminal.nix
    ./display/vscode.nix
  ];
}
