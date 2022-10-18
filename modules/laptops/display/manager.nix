{ ... }:
{
  services.xserver.enable = true;
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "bpaulin";
    };
    gdm.enable = true;
  };
}
