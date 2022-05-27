{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # to allow nix to set gnome settings
    dconf
    # to search for settings to change
    gnome.dconf-editor
    # to generate nixconfig from dconf
    dconf2nix
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
  };
}
