{ pkgs, ... }:

{
  imports = [
    (fetchGit { url = "https://github.com/ailox/shadow-nix"; ref = "ailox-alsalib"; } + "/import/system.nix")
  ];

  programs.shadow-client = {
    enable = true;
    channel = "prod";
    forceDriver = "iHD";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
