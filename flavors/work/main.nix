{ config, pkgs, ... }:
{
  environment.etc = {
    "NetworkManager/system-connections/work_vpn.nmconnection" = {
      user = "root";
      group = "root";
      source = ./../../etc/work_vpn.nmconnection;
      mode = "0600";
    };
    "NetworkManager/system-connections/work_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./../../etc/work_wifi.nmconnection;
      mode = "0600";
    };
  };

  networking.networkmanager = {
    plugins = [
      pkgs.networkmanager-sstp
    ];
    dispatcherScripts = [
      {
        source = pkgs.writeText "upHook" ''

          if [ "$2" = "vpn-up" ]; then
            ${pkgs.unixtools.ifconfig}/bin/ifconfig "$1" mtu 1390 up
          fi

    '';
        type = "basic";
      }
    ];
  };

  security.sudo.extraConfig = "
    Defaults env_keep += http_proxy
    Defaults env_keep += https_proxy
    Defaults env_keep += no_proxy
    Defaults env_keep += CURL_NIX_FLAGS
  ";

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.file = {
      ".private_env.sh".source = ./../../.private_env.sh;
      "setproxy.sh".source = ./scripts/setproxy.sh;
    };
    programs = {
      zsh = {
        initExtraBeforeCompInit = "
        test -f $HOME/.abox.sh && source $HOME/.abox.sh
      ";
        initExtra = "
        source $HOME/setproxy.sh
      ";
      };
      ssh = {
        includes = [
          "vpoda3_ssh_config"
        ];
      };
      git = {
        includes = [
          {
            condition = "gitdir:**/*" + builtins.getEnv "WORK_GIT_REGISTRY" + "/**";
            contents = {
              user = {
                email = builtins.getEnv "WORK_EMAIL";
                # signingKey = "2DCE07FF5DC04E9B1F94B03B21C4470EE6C38530";
              };
            };
          }
        ];
      };
    };

    dconf.settings = {
      "system/proxy" = {
        mode = true;
        autoconfig-url = builtins.getEnv "PROXY_PAC";
      };
    };
  };
}
