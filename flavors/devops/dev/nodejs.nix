{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      nodejs
      yarn
      nodePackages.npm
      nodePackages.prettier
      nodePackages.vue-cli
    ];

    programs.vscode = {
      extensions = with pkgs.vscode-extensions; [
        octref.vetur
      ];
    };
  };
}
