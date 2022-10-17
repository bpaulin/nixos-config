##
# Rust toolbox
#
# tested on https://www.rust-lang.org/learn/get-started
##
{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      cargo
      rustc
      rustfmt
      gcc
    ];

    programs = {
      # vscode extensions
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          matklad.rust-analyzer
        ];
      };

      # vim plugins
      neovim = {
        plugins = with pkgs.vimPlugins; [
          rust-vim
        ];
      };
    };
  };
}
