{ pkgs, ... }:
{
  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";
  services.xserver.layout = "fr";
}
