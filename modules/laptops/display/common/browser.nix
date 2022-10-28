{ ... }:
{
  xdg.portal = {
    # need to set enable-webrtc-pipewire-capturer in chrome://flags/
    enable = true;
  };

  home-manager.users.bpaulin = { pkgs, ... }: {
    programs.firefox = {
      enable = true;
    };
    programs.chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
  };
}
