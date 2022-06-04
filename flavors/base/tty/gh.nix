##
# Github client
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    programs = {
      gh = {
        enable = true;
        package = pkgs.gitAndTools.gh;
        settings = {
          git_protocol = "ssh";
        };
      };
    };
  };
}
