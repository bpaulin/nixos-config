{ pkgs, ... }:
{
  services.acpid.enable = true;

  environment.systemPackages = with pkgs; [
    # packages
    acpi
    lm_sensors
  ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # packages
      pdftk
    ];
  };
}
