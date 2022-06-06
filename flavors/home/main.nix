{ config, pkgs, ... }:
let
  sysconfig = (import <nixpkgs/nixos> { }).config;
in
{
  environment.etc = {
    "NetworkManager/system-connections/home_wifi.nmconnection" = {
      user = "root";
      group = "root";
      mode = "0600";
      text = "
[connection]
id=${sysconfig.settings.HOME_WIFI_SSID}
uuid=319b1a3f-23d3-4b4d-b2d3-0eabdc391708
type=wifi
interface-name=wlp1s0

[wifi]
mode=infrastructure
ssid=${sysconfig.settings.HOME_WIFI_SSID}

[wifi-security]
key-mgmt=wpa-psk
psk=${sysconfig.settings.HOME_WIFI_PSK}

[ipv4]
method=auto

[ipv6]
addr-gen-mode=stable-privacy
method=auto

[proxy]

";
    };
    "NetworkManager/system-connections/phone_wifi.nmconnection" = {
      user = "root";
      group = "root";
      mode = "0600";
      text = "
[connection]
id=${sysconfig.settings.PHONE_WIFI_SSID}
uuid=39264d3f-b409-441e-8301-5af8d7b211d4
type=wifi
interface-name=wlp1s0

[wifi]
mode=infrastructure
ssid=${sysconfig.settings.PHONE_WIFI_SSID}

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=${sysconfig.settings.PHONE_WIFI_PSK}

[ipv4]
method=auto

[ipv6]
addr-gen-mode=stable-privacy
method=auto

[proxy]
";
    };
  };
}
