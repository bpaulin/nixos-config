{ pkgs, ... }:
{

  services.xserver.desktopManager.gnome.enable = true;

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.file = {
      # https://unsplash.com/photos/0_xMuEbpFAQ
      ".local/share/backgrounds/sillywalk.jpg".source = ./../sillywalk.jpg;
    };

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

    # Gtk theme
    gtk = {
      enable = true;
      theme = {
        package = pkgs.orchis-theme;
        name = "Orchis";
      };
    };

    dconf.settings = {
      "org/gnome/desktop/peripherals/touchpad" = {
        # to have touchpad and mouse behave the same way
        natural-scroll = false;
      };
      "org/gnome/shell/app-switcher" = {
        # Limit switcher to current workspace.
        current-workspace-only = true;
      };
      "org/gnome/mutter" = {
        # Workspaces on all displays
        workspaces-only-on-primary = false;
      };
      "org/gnome/shell" = {
        # apps on dock
        favorite-apps = [
          # vscode
          "code.desktop"
          # chrome
          "google-chrome.desktop"
          # terminal
          "terminator.desktop"
        ];
      };
      "org/gnome/desktop/a11y" = {
        # old geek on couch: fast access to large text
        always-show-universal-access-status = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/bpaulin/.local/share/backgrounds/sillywalk.jpg";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
