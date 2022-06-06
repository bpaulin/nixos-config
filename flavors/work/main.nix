{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in
{
  environment.etc = {
    "NetworkManager/system-connections/work_vpn.nmconnection" = {
      user = "root";
      group = "root";
      mode = "0600";
      text = "
[connection]
id=vpn
uuid=7b9ab846-3261-46ea-aeb5-381b8db71237
type=vpn
autoconnect=false
permissions=user:bpaulin:;

[vpn]
connection-type=password
gateway=${sysconfig.settings.WORK_VPN_GW}
ignore-cert-warn=yes
password-flags=0
refuse-chap=yes
refuse-eap=yes
refuse-mschap=no
refuse-mschapv2=no
refuse-pap=yes
tls-ext=yes
tls-verify-key-usage=no
user=${sysconfig.settings.LDAP_USER}
service-type=org.freedesktop.NetworkManager.sstp

[vpn-secrets]
password=${sysconfig.settings.LDAP_PASSWORD}

[ipv4]
method=auto

[ipv6]
addr-gen-mode=stable-privacy
method=auto

[proxy]

";
    };
    "NetworkManager/system-connections/work_wifi.nmconnection" = {
      user = "root";
      group = "root";
      mode = "0600";
      text = "
[connection]
id=${sysconfig.settings.WORK_WIFI_SSID}
uuid=c2916d12-b7b6-44ec-aa76-2ef05bec0273
type=wifi
permissions=

[wifi]
mac-address-blacklist=
mode=infrastructure
ssid=${sysconfig.settings.WORK_WIFI_SSID}

[wifi-security]
key-mgmt=wpa-eap

[802-1x]
eap=peap;
identity=${sysconfig.settings.LDAP_USER}
password=${sysconfig.settings.LDAP_PASSWORD}
phase2-auth=mschapv2

[ipv4]
dns-search=
method=auto

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
method=auto

[proxy]
";
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
      # ".private_env.sh".source = ./../../.private_env.sh;
      "setproxy.sh".source = ./scripts/setproxy.sh;
    };
    home.sessionVariables = {
      PROXY_HOST = sysconfig.settings.PROXY_HOST;
      PROXY_PORT = sysconfig.settings.PROXY_PORT;
      LDAP_USER = sysconfig.settings.LDAP_USER;
      LDAP_PASSWORD = sysconfig.settings.LDAP_PASSWORD;
      WORK_DOCKER_REGISTRY = sysconfig.settings.WORK_DOCKER_REGISTRY;
      VAULT_TOKEN = sysconfig.settings.VAULT_TOKEN;
      VAULT_ADDR = sysconfig.settings.VAULT_ADDR;
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
            condition = "gitdir:**/*" + sysconfig.settings.WORK_GIT_REGISTRY + "/**";
            contents = {
              user = {
                email = sysconfig.settings.WORK_EMAIL;
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
        autoconfig-url = sysconfig.settings.PROXY_PAC;
      };
    };
  };
}
