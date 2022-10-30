{ ... }:
{

  services.xserver.desktopManager.gnome.enable = true;

  imports = [
    ./just-perfection.nix
  ];

  home-manager.users.bpaulin = { pkgs, lib, ... }: {

    home.file = {
      ".local/share/backgrounds/wallpaper.png".source = ./../../../../machines/local/wallpaper.png;
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
        tap-to-click = true;
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
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/bpaulin/.local/share/backgrounds/wallpaper.png";
        picture-uri-dark = "file:///home/bpaulin/.local/share/backgrounds/wallpaper.png";
        picture-options = "scaled";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-temperature = lib.hm.gvariant.mkUint32 3700;
      };
    };
  };
}
