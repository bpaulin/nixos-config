{ config, pkgs, ... }:
{
  imports = [
    ./display/gnome.nix
    ./display/browser.nix
    ./display/terminal.nix
    ./display/vscode.nix
  ];
}
