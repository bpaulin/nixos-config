{ ... }:
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
          version = "0.7.1";
          sha256 = "0n4z3s6wkx6dkigiarcrq8vslax045lm53chsilsxrfdq0232g72";
        }
      ];
    };
  };
}
