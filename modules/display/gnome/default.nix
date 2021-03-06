{ pkgs, ... }:
{

  services.xserver.desktopManager.gnome.enable = true;

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.file = {
      # https://unsplash.com/photos/0_xMuEbpFAQ
      ".local/share/backgrounds/wallpaper.svg".source = ./../wallpaper.svg;
      ".config/autostart/guake.desktop" = {
        source = "${pkgs.guake}/share/applications/guake.desktop";
      };
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
      # dropdown terminal
      guake
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
          "org.gnome.Console.desktop"
        ];
      };
      "org/gnome/desktop/a11y" = {
        # geek on couch: fast access to large text
        always-show-universal-access-status = true;
      };
      "org/gnome/desktop/wm/preferences" = {
        # geek on couch: fast access to large text
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/bpaulin/.local/share/backgrounds/wallpaper.svg";
      };
      "apps/guake/general" = {
        start-fullscreen = true;
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Control>twosuperior";
        command = "guake-toggle";
        name = "guake";
      };
    };
  };
}
