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
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "ansible-vault-inline";
          publisher = "wolfmah";
          version = "0.4.0";
          sha256 = "sha256-pU2tKnYKZ/w02fD3BonrYByB+bsxx4ycqDO3q5ltzt4=";
        }
      ];
    };
  };
}
