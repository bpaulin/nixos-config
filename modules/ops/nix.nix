##
# Nix tools and config
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Nix file formatter
      nixpkgs-fmt
      # Configuration explorer
      nixos-option
      # Language server
      rnix-lsp
      # Packages tools
      node2nix # node
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ];
      };

      neovim = {
        plugins = with pkgs.vimPlugins; [
          vim-nix
        ];
      };
    };
  };
}
