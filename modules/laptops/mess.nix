{ pkgs, ... }:
{
  nixpkgs.overlays = [
    # overlays
  ];

  environment.systemPackages = with pkgs; [
    # packages
  ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # packages
    ];
  };
}
