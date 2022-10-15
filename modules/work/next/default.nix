{ config, pkgs, lib, ... }:

{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      go-jira
      slack
    ];
  };
}
