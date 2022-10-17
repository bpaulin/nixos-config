{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      # ansible
      ansible-lint
      # molecule
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
            version = "1.0.92";
            sha256 = "1r35ximw1v91615gfrn6z52l8xcj5n6s6p1p74x3b339m4ds14xx";
          }
        ];
      };
    };
  };
}
