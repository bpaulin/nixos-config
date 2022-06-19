{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      sops
      age
      vault
      vault-medusa
    ];
  };
}