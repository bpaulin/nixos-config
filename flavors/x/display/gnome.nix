{ pkgs, ... }:
{

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # to allow nix to set gnome settings
      dconf
      # to search for settings to change
      gnome.dconf-editor
      # to generate nixconfig from dconf
      dconf2nix
      # to change settings manually
      gnome.gnome-tweaks
    ];

    dconf.settings = {
      "org/gnome/desktop/peripherals/touchpad" = {
        # to have touchpad and mouse behave the same way
        natural-scroll = false;
      };
      "org/gnome/shell/app-switcher" = {
        # Limit switcher to current workspace.
        current-workspace-only = true;
      };
      "org/gnome/shell" = {
        # apps on dock
        favorite-apps = [
          # vscode
          "code.desktop"
          # chrome
          "google-chrome.desktop"
          # terminal
          "org.gnome.Console.desktop"
        ];
      };
      "org/gnome/desktop/a11y" = {
        # geek on couch: fast access to large text
        always-show-universal-access-status = true;
      };
    };
  };
}
