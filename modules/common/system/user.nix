{ pkgs, ... }:
{
  environment.shells = [ pkgs.zsh pkgs.bashInteractive ];

  services.accounts-daemon.enable = true;

  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    uid = 1000;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = false;
    # mkpasswd -m sha-512 // https://nixos.org/manual/nixos/stable/#sec-user-management
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  home-manager.users.bpaulin = { ... }: {
    home.username = "bpaulin";
    home.homeDirectory = "/home/bpaulin";

    programs.home-manager.enable = true;

    home.stateVersion = "22.05";
  };
}
