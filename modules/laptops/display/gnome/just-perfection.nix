{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.just-perfection
  ];

  home-manager.users.bpaulin = { ... }: {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "just-perfection-desktop@just-perfection"
        ];
      };
      "org/gnome/shell/extensions/just-perfection" = {
        panel = true;
        panel-in-overview = true;
      };
    };
  };
}
