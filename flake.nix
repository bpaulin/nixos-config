{
  description = "A very basic flake";

  # the source of your packages
  inputs = {
    # normal nix stuff
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    # home-manager stuff
    home-manager.url = "github:nix-community/home-manager/release-22.05";

    # use the version of nixpkgs we specified above rather than the one HM would ordinarily use
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = github:Mic92/sops-nix;
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";


    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  # what will be produced (i.e. the build)
  outputs = { self, sops-nix, nixos-hardware, ... }@inputs: {
    # define a "nixos" build
    nixosConfigurations.lithium = inputs.nixpkgs.lib.nixosSystem {
      # system to build for
      system = "x86_64-linux";
      # modules to use
      modules = [
        ./configuration.nix # our previous config file
        inputs.home-manager.nixosModules.home-manager # make home manager available to configuration.nix
        {
          # use system-level nixpkgs rather than the HM private ones
          # "This saves an extra Nixpkgs evaluation, adds consistency, and removes the dependency on NIX_PATH, which is otherwise used for importing Nixpkgs."
          home-manager.useGlobalPkgs = true;
        }
        nixos-hardware.nixosModules.common-cpu-intel
        nixos-hardware.nixosModules.common-pc-laptop-ssd
        sops-nix.nixosModules.sops
      ];
    };
  };
}
