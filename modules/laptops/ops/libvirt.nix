{ ... }:
{

  virtualisation.libvirtd.enable = true;

  users.users.bpaulin = {
    extraGroups = [ "libvirtd" ];
  };

  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      gnome.gnome-boxes
    ];
  };
}
