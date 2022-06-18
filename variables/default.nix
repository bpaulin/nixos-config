{ config, pkgs, ... }:
{
  imports = [
    ./secrets.nix
    ./flags.nix
  ];
}
