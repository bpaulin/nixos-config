{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      tilt
    ];

    programs.vscode = {
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "tiltfile";
          publisher = "tilt-dev";
          version = "0.0.3";
          sha256 = "1ih91788pm106265mn085db2dhv4n60rkfk4m9igy7q7bjcs63r9";
        }
      ];
    };
  };
}
