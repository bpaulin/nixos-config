{ pkgs, ... }:

{
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

  home-manager.users.bpaulin = { pkgs, ... }: {
    imports = [
      (fetchGit { url = "https://github.com/ailox/shadow-nix"; ref = "ailox-alsalib"; } + "/import/home-manager.nix")
    ];

    programs.shadow-client = {
      # Enabled by default when using import
      # enable = true;
      channel = "prod";
    };

    home.packages = with pkgs; [
      sgtpuzzles
    ];
  };
}
