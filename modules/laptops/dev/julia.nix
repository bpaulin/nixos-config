##
# Julia toolbox
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      julia-bin
    ];
  };
}
