{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      azure-cli
      google-cloud-sdk
      awscli2
      eksctl
      aws-workspaces
      heroku
      nodePackages.firebase-tools
      ngrok
      teleport
    ];

    programs = {
      starship = {
        settings = {
          gcloud = {
            disabled = true;
          };
        };
      };
    };
  };
}
