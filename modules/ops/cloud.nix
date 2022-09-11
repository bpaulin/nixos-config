{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      azure-cli
      google-cloud-sdk
      aws
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
