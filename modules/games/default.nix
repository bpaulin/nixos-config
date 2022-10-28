{ ... }:

{

  imports = [
    # ./shadow.nix
    ./steam.nix
  ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      sgtpuzzles
    ];
  };
}
