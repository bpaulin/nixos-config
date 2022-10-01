##
# Nix tools and config
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
