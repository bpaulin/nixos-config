{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      sops
      age
    ];

    programs.vscode = {
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "signageos-vscode-sops";
          publisher = "signageos";
          version = "0.6.0";
          sha256 = "sha256-Ge1pkJlsEiXtzMhuHFOi6+kguDW/P7uXGNOiHJCDV1k=";
        }
      ];
    };
  };
}
