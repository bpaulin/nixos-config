##
# (Neo)Vim configuration
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
