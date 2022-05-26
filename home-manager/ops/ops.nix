{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ansible
    terraform
    vault
  ];


  programs = {
    vscode = {
      extensions = with pkgs.vscode-extensions; [
        hashicorp.terraform
      ];
    };
  };
}
