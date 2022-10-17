##
# (Neo)Vim configuration
##
{ ... }:
{
  home-manager.users.bpaulin = { ... }: {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
