{ pkgs, ... }:
{
  programs = {
    gh = {
      enable = true;
      package = pkgs.gitAndTools.gh;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
