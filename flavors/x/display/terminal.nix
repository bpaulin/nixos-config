{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      guake
    ];

    programs = {
      terminator = {
        enable = true;
        config = {
          profiles.default.show_titlebar = false;
          profiles.default.scrollbar_position = "hidden";
        };
      };
    };

    home.file = {
      ".config/autostart/guake.desktop" = {
        source = "${pkgs.guake}/share/applications/guake.desktop";
      };
    };

    dconf.settings = {
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
