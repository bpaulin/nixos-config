{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanager-sstp
  ];

  home.file = {
    # File exporting
    # PROXY_HOST
    # PROXY_PORT
    # LDAP_USER
    # LDAP_PASSWORD
    # WORK_DOCKER_REGISTRY
    # VAULT_TOKEN
    # VAULT_ADRESS
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

