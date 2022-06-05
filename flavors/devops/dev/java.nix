{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      maven
      jdk
    ];

    programs.vscode = {
      extensions = with pkgs.vscode-extensions; [
        redhat.java
      ];
    };

  };
}
