{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   networkmanager-sstp
  # ];

  home.file = {
    ".private_env.sh".source = ./../../.private_env_run.sh;
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

