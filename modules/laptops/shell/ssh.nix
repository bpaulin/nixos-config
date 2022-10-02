{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    programs = {
      ssh = {
        enable = true;
      };
    };
  };
}
