{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      nodejs
      nodePackages.npm
      nodePackages.prettier
    ];
  };
}
