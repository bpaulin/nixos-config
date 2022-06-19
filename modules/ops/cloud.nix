{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      azure-cli
      google-cloud-sdk
      aws
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
