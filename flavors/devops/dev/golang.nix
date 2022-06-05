{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      gopls
      go-outline
      go-tools
    ];

    programs = {
      go = {
        enable = true;
      };

      vscode = {
        extensions = with pkgs.vscode-extensions; [
          golang.go
        ];
      };
    };
  };
}
