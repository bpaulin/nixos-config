{ pkgs, ... }:
{
  programs.ssh.startAgent = true;
  home-manager.users.bpaulin = { pkgs, ... }: {

    programs = {
      ssh = {
        enable = true;
      };
    };
  };
}
