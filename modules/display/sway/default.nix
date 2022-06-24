{ pkgs, config, lib, ... }:
{

  services.xserver.displayManager.sessionPackages = [
    pkgs.sway
  ];
  programs.sway.enable = true;

  home-manager.users.bpaulin = { pkgs, config, ... }: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" "custom/hello-from-waybar" ];
          modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];
        };
      };
    };
    programs.foot.enable = true;
    wayland.windowManager.sway = {
      enable = true;
      config = {
        input = {
          "*" = {
            xkb_layout = "fr";
          };
        };
        keybindings =
          let
            modifier = config.wayland.windowManager.sway.config.modifier;
          in
          lib.mkOptionDefault {
            "${modifier}+ampersand" = "workspace 1";
            "${modifier}+eacute" = "workspace 2";
            "${modifier}+quotedbl" = "workspace 3";
            "${modifier}+apostrophe" = "workspace 4";
            "${modifier}+parenleft" = "workspace 5";
            "${modifier}+egrave" = "workspace 6";
            "${modifier}+minus" = "workspace 7";
            "${modifier}+underscore" = "workspace 8";
            "${modifier}+ccedilla" = "workspace 9";
            "${modifier}+agrave" = "workspace 10";
            "${modifier}+Shift+ampersand" = "move container to workspace 1";
            "${modifier}+Shift+eacute" = "move container to workspace 2";
            "${modifier}+Shift+quotedbl" = "move container to workspace 3";
            "${modifier}+Shift+apostrophe" = "move container to workspace 4";
            "${modifier}+Shift+parenleft" = "move container to workspace 5";
            "${modifier}+Shift+egrave" = "move container to workspace 6";
            "${modifier}+Shift+minus" = "move container to workspace 7";
            "${modifier}+Shift+underscore" = "move container to workspace 8";
            "${modifier}+Shift+ccedilla" = "move container to workspace 9";
            "${modifier}+Shift+agrave" = "move container to workspace 10";
          };
      };
    };

    home.packages = with pkgs; [
      dmenu
    ];
  };
}
