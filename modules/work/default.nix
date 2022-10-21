{ lib, ... }:

{
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
      ];

      programs.git = {
        includes = [
          {
            condition = "gitdir:**/*github.com/myERP/**";
            contents = {
              user = {
                email = "bruno@oneup.com";
                signingKey = config.id_pub.oneup;
              };
            };
          }
        ];
      };
    };
  };
}
