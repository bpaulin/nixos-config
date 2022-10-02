{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      azure-cli
      google-cloud-sdk
      awscli2
      heroku
      nodePackages.firebase-tools
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
