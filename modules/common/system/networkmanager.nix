{ ... }:
{
  networking.networkmanager = {
    enable = true;
  };

  users.users.bpaulin = {
    extraGroups = [ "networkmanager" ];
  };
}
