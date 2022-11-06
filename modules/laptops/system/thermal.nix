{ pkgs, ... }:
{
  services.acpid.enable = true;

  environment.systemPackages = with pkgs; [
    # packages
    acpi
    lm_sensors
  ];
}
