{ lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    networkmanager-openvpn
  ];

  home-manager.users.bpaulin = { pkgs, config, ... }: {
    options = {
      id_pub = {
        oneup = lib.mkOption {
          type = lib.types.str;
        };
      };
    };

    config = {
      home.packages = with pkgs; [
        go-jira
        slack
        bitwarden
        bitwarden-cli
        openldap
        authy
      ];

      programs = {
        git = {
          includes = [
            {
              condition = "gitdir:**/*github.com/myERP/**";
              contents = {
                user = {
                  email = "bruno@myerp.com";
                  signingKey = config.id_pub.oneup;
                };
              };
            }
            {
              condition = "gitdir:**/*github.com/bpaulin-oneup/**";
              contents = {
                user = {
                  email = "bruno@myerp.com";
                  signingKey = config.id_pub.oneup;
                };
              };
            }
          ];
        };
        ssh = {
          extraConfig = "
IdentityFile /home/bpaulin/.ssh/id_ed25519_oneup
        ";
        };
      };
    };
  };
}
