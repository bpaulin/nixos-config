##
# Nix tools and config
##
{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Nix file formatter
      nixpkgs-fmt
      # Configuration explorer
      nixos-option
      # Language server
      rnix-lsp
    ];

    programs = {
      neovim = {
        plugins = with pkgs.vimPlugins; [
          vim-nix
        ];
      };
    };
  };
}
