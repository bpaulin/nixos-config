{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.callPackage <agenix/pkgs/agenix.nix> { })
  ];

  age = {
    identityPaths = [ "/etc/nixos/id_ed25519" ];
    secrets = {
      testsecret = {
        file = ../../../secrets/testsecret.age;
        path = "/home/bpaulin/testsecret";
        mode = "770";
        owner = "bpaulin";
        group = "users";
        symlink = false;
      };
    };
  };
}
