{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
    vgo2nix
  ];
  programs = {
    vscode = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];
    };
  };
}
