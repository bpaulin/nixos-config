{ config, pkgs, ... }:
{
  imports =
    [
      ./machines/local/hardware-configuration.nix
      ./machines/local/configuration.nix
      <home-manager/nixos>
      ./flavors/base
      ./variables
    ];

  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";
  services.xserver.layout = "fr";

  networking.networkmanager = {
    enable = true;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    vim
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.username = "bpaulin";
    home.homeDirectory = "/home/bpaulin";

    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
  };

  system.stateVersion = "22.05";
}

