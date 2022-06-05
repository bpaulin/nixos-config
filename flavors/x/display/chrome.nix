{ pkgs, ... }:
{
  xdg.portal = {
    # need to set enable-webrtc-pipewire-capturer in chrome
    enable = true;
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
  };
}
