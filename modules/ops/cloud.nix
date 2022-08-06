{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      azure-cli
      google-cloud-sdk
      aws
      heroku
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
