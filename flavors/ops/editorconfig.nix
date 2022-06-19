##
# Editor config
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          editorconfig.editorconfig
        ];
      };

      neovim = {
        plugins = with pkgs.vimPlugins; [
          editorconfig-nvim
        ];
      };
    };
  };
}
