{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  imports = [
    ./gnome
    ./common/browser.nix
    ./common/terminal.nix
    ./common/vscode.nix
  ];
}
