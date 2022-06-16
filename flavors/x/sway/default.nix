{ pkgs, ... }:
{

  services.xserver.displayManager.sessionPackages = [
    pkgs.sway
  ];
  programs.sway.enable = true;

  home-manager.users.bpaulin = { pkgs, ... }: {
    wayland.windowManager.sway.enable = true;
  };
}
