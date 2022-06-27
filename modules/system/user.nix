{ pkgs, ... }:
{
  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    uid = 1000;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.username = "bpaulin";
    home.homeDirectory = "/home/bpaulin";


    nixpkgs.overlays = [
      # to add packages not yet in nixpkgs
      (import ../../pkgs/nixpkgs)
      # to add packages specific to my uses
      (import ../../pkgs/specific)
    ];

    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
  };
}
