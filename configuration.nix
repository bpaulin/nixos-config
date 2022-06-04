{ config, pkgs, ... }:
{
  imports =
    [
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix
      <home-manager/nixos>
      ./flavors/base/main.nix
    ];

  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";
  services.xserver.layout = "fr";

  networking.networkmanager = {
    enable = true;
  };
  environment.etc = {
    "NetworkManager/system-connections/home_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/home_wifi.nmconnection;
      mode = "0600";
    };
    "NetworkManager/system-connections/phone_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/phone_wifi.nmconnection;
      mode = "0600";
    };
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  xdg.portal = {
    # need to set enable-webrtc-pipewire-capturer in chrome
    enable = true;
  };


  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    # enableSSHSupport = true;
  };

  virtualisation.docker.enable = true;


  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;

  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    pinentry-gnome
    pinentry
    openssl
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.username = "bpaulin";
    home.homeDirectory = "/home/bpaulin";

    home.stateVersion = "22.05";

    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;
  };

  system.stateVersion = "22.05";
}

