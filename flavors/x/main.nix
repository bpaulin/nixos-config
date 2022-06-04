{ config, pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    imports = [
      ./display/gnome.nix
      ./display/chrome.nix
      ./display/terminal.nix
      ./display/vscode.nix
    ];
  };
}
