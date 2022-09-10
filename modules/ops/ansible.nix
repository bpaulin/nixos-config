{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      ansible
      ansible-lint
      molecule
      ansible-builder
      j2cli
    ];

    programs = {
      vscode = {
        extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "ansible-vault-inline";
            publisher = "wolfmah";
            version = "0.4.0";
            sha256 = "sha256-pU2tKnYKZ/w02fD3BonrYByB+bsxx4ycqDO3q5ltzt4=";
          }
          {
            name = "ansible";
            publisher = "redhat";
            version = "0.11.29";
            sha256 = "0qhkqr7a2fl05r7ryb35r58mj8zja4fysmxj4y25n9hjllg2ax5n";
          }
        ];
      };
    };
  };
}
