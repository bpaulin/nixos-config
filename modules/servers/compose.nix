{ ... }:
{

  networking.firewall.allowedTCPPorts = [
    # kube api
    48123
  ];
  virtualisation.docker.enable = true;

  users.users.bpaulin = {
    extraGroups = [ "docker" ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      docker-compose
      ctop
    ];
  };
}
