{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      nixpkgs-fmt
      nixos-option
      rnix-lsp
      vgo2nix
      node2nix
    ];
    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
