{ pkgs, ... }:
{
  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.username = "bpaulin";
    home.homeDirectory = "/home/bpaulin";

    # to add packages not yet in nixpkgs
    nixpkgs.overlays = [ (import ../../pkgs) ];

    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.05";
  };
}
