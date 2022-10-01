{ config, pkgs, lib, ... }:

lib.mkIf (config.flags.forGames) {
  fonts.fonts = with pkgs; [
    liberation_ttf
  ];

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  programs.steam.enable = true;
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      ckan
    ];
  };
}
