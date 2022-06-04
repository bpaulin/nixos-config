{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
    nixos-option
    rnix-lsp
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
