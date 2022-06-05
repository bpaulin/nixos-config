{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      groovy
    ];

    programs = {
      vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-groovy-lint";
            publisher = "NicolasVuillamy";
            version = "1.9.0";
            sha256 = "sha256-ZbOC09Ispw/nld8pSmtW8K9PPg10FkN27dTa1Or3DdI=";
          }
        ];
      };
    };
  };
}
