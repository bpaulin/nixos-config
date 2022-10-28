{ ... }:
{
  programs.ssh.startAgent = true;

  home-manager.users.bpaulin = { ... }: {
    programs = {
      ssh = {
        enable = true;
        extraConfig = "
IdentityFile /home/bpaulin/.ssh/id_ed25519_bpaulin
        ";
      };
    };
  };
}
