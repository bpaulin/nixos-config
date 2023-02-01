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
            sha256 = "1pnfdncspdrkm2f8riripgwq2730xf4hdxzhv4sgqrqafqmaskd5";
          }
          {
            name = "ansible";
            publisher = "redhat";
            version = "1.1.34";
            sha256 = "0ca0rhw6fx49ycv9pih7zhn6hw5gqh3h6darcl0rlamnjx11n82k";
          }
        ];
      };
    };
  };
}
