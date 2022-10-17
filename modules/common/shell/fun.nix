##
# Useless things ... i want them everywhere
##
{ ... }:
{
  # will recompile sudo just to insult me, obviously mandatory
  nixpkgs.overlays = [
    (import ../../../pkgs/overlays/sudo.nix)
  ];
}
