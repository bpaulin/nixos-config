{ ... }:
{
  home-manager.users.bpaulin = { ... }: {

    programs = {
      ssh = {
        enable = true;
      };
    };
  };
}
