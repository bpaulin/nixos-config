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
        zsh = {
          initExtra = "
test -f $HOME/.oneup.sh && source $HOME/.oneup.sh
";
        };
        git = {
          includes = [
            {
              condition = "gitdir:**/*github.com/myERP/**";
              contents = {
                user = {
                  email = "bruno@myerp.com";
                  signingKey = config.id_pub.oneup;
                };
                core = {
                  sshCommand = "ssh -i ~/.ssh/id_ed25519_oneup -o IdentitiesOnly=yes -F /dev/null";
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
                core = {
                  sshCommand = "ssh -i ~/.ssh/id_ed25519_oneup -o IdentitiesOnly=yes -F /dev/null";
                };
              };
            }
          ];
        };
      };
    };
  };
}
