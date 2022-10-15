{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "SauceCodePro Nerd Font"
  ];
}
