{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in

{

  imports = [
    ./secrets.nix
  ];

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
gateway=${sysconfig.secrets-json.WORK_VPN_GW}
ignore-cert-warn=yes
password-flags=0
refuse-chap=yes
refuse-eap=yes
refuse-mschap=no
refuse-mschapv2=no
refuse-pap=yes
tls-ext=yes
tls-verify-key-usage=no
user=${sysconfig.secrets-json.LDAP_USER}
service-type=org.freedesktop.NetworkManager.sstp

[vpn-secrets]
password=${sysconfig.secrets-json.LDAP_PASSWORD}

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
id=${sysconfig.secrets-json.WORK_WIFI_SSID}
uuid=c2916d12-b7b6-44ec-aa76-2ef05bec0273
type=wifi
permissions=

[wifi]
mac-address-blacklist=
mode=infrastructure
ssid=${sysconfig.secrets-json.WORK_WIFI_SSID}

[wifi-security]
key-mgmt=wpa-eap

[802-1x]
eap=peap;
identity=${sysconfig.secrets-json.LDAP_USER}
password=${sysconfig.secrets-json.LDAP_PASSWORD}
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

  home-manager.users.bpaulin = { ... }: {
    home.file = {
      "setproxy.sh".source = ./scripts/setproxy.sh;
      ".m2/settings.xml" = {
        target = ".m2/settings.xml";
        text = ''
          <settings xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
            <localRepository xmlns="http://maven.apache.org/SETTINGS/1.1.0">/home/bpaulin/.m2/repository</localRepository>
            <interactiveMode xmlns="http://maven.apache.org/SETTINGS/1.1.0">false</interactiveMode>
            <servers xmlns="http://maven.apache.org/SETTINGS/1.1.0">
              <server>
                <username>${sysconfig.secrets-json.WORK_MAVEN_USER}</username>
                <password>${sysconfig.secrets-json.WORK_MAVEN_PASS}</password>
                <id>artifactory</id>
              </server>
            </servers>
            <mirrors xmlns="http://maven.apache.org/SETTINGS/1.1.0">
              <mirror>
                <mirrorOf>*</mirrorOf>
                <url>${sysconfig.secrets-json.WORK_MAVEN_URL}</url>
                <id>artifactory</id>
              </mirror>
            </mirrors>
            <profiles xmlns="http://maven.apache.org/SETTINGS/1.1.0">
              <profile>
                <repositories>
                  <repository>
                    <releases />
                    <snapshots />
                    <id>artifactory</id>
                    <name>Repo Artifactory animco</name>
                    <url>${sysconfig.secrets-json.WORK_MAVEN_URL}</url>
                  </repository>
                </repositories>
                <pluginRepositories>
                  <pluginRepository>
                    <releases />
                    <snapshots />
                    <id>artifactory</id>
                    <url>${sysconfig.secrets-json.WORK_MAVEN_URL}</url>
                  </pluginRepository>
                </pluginRepositories>
                <activation>
                  <activeByDefault>true</activeByDefault>
                </activation>
                <id>artifactory</id>
              </profile>
            </profiles>
            <activeProfiles xmlns="http://maven.apache.org/SETTINGS/1.1.0">
              <activeProfile>artifactory</activeProfile>
            </activeProfiles>
            <pluginGroups xmlns="http://maven.apache.org/SETTINGS/1.1.0">
              <pluginGroup>org.apache.maven.plugins</pluginGroup>
              <pluginGroup>org.codehaus.mojo</pluginGroup>
            </pluginGroups>
          </settings>
        '';
      };
    };
    home.sessionVariables = {
      PROXY_HOST = sysconfig.secrets-json.PROXY_HOST;
      PROXY_PORT = sysconfig.secrets-json.PROXY_PORT;
      LDAP_USER = sysconfig.secrets-json.LDAP_USER;
      LDAP_PASSWORD = sysconfig.secrets-json.LDAP_PASSWORD;
      WORK_DOCKER_REGISTRY = sysconfig.secrets-json.WORK_DOCKER_REGISTRY;
      VAULT_TOKEN = sysconfig.secrets-json.VAULT_TOKEN;
      VAULT_ADDR = sysconfig.secrets-json.VAULT_ADDR;
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
            condition = "gitdir:**/*" + sysconfig.secrets-json.WORK_GIT_REGISTRY + "/**";
            contents = {
              user = {
                email = sysconfig.secrets-json.WORK_EMAIL;
              };
            };
          }
        ];
      };
    };

    dconf.settings = {
      "system/proxy" = {
        mode = "auto";
        autoconfig-url = sysconfig.secrets-json.PROXY_PAC;
      };
    };
  };
}
