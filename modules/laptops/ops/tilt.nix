{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      tilt
    ];

    programs.vscode = {
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "Tiltfile";
          publisher = "tilt-dev";
          version = "0.0.3";
          sha256 = "sha256-KQ+jmVwHH/9iqmS6mYGxZMMmVisI2FqMMCDUi9AJCcY=";
        }
      ];
    };
  };
}
