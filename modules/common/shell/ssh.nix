{ ... }:
{
  programs.ssh.startAgent = true;

  home-manager.users.bpaulin = { ... }: {
    programs = {
      ssh = {
        enable = true;
        includes = [
          "config.d/*"
        ];
      };
    };
  };
}
