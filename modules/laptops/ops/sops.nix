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
          version = "0.6.1";
          sha256 = "0a2hdwnd0hsyhnx3bmwjn6y9a8lz7cgzgrar8yrp249yywhy4xbw";
        }
      ];
    };
  };
}
