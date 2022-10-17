##
# Golang toolbox
##
{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      # go language server
      gopls
      # used by the vscode extension (and maybe others)
      go-outline
      go-tools
    ];

    programs = {
      # install go
      go = {
        enable = true;
      };

      # vscode extensions
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          golang.go
        ];
      };

      # vim plugins
      neovim = {
        plugins = with pkgs.vimPlugins; [
          vim-go
        ];
      };
    };
  };
}
