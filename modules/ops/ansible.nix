{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      ansible
      ansible-lint
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
            version = "0.10.0";
            sha256 = "sha256-cXDr0vNDjn3HZdKdFhE0yXo8dLS78LIqhZ5tY//2EDo=";
          }
        ];
      };
    };
  };
}
