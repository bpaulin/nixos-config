{ ... }:
{

  virtualisation.docker.enable = true;

  users.users.bpaulin = {
    extraGroups = [ "docker" ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      docker-compose
      ctop
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          ms-azuretools.vscode-docker
        ];
      };
    };
  };
}
