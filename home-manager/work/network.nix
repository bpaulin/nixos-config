{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanager-sstp
  ];

  home.file = {
    ".private_env.sh".source = ./.private_env.sh;
    "setproxy.sh".source = ./setproxy.sh;
  };
  programs = {
    zsh = {
      initExtra = "
        source $HOME/setproxy.sh
      ";
    };
  };
}

