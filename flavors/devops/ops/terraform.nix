{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      terraform
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          hashicorp.terraform
        ];
      };
    };
  };
}
