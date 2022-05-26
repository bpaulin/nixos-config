{ pkgs, ... }:
{
  programs = {
    ssh = {
      includes = [
        "vpoda3_ssh_config"
      ];
    };
    git = {
      includes = [
        {
          condition = "gitdir:**/*bitbucket.agilefabric.fr.carrefour.com/**";
          contents = {
            user = {
              email = "bruno_paulin@carrefour.com";
              # signingKey = "2DCE07FF5DC04E9B1F94B03B21C4470EE6C38530";
            };
          };
        }
      ];
    };
    zsh = {
      initExtraBeforeCompInit = "
        test -f $HOME/.abox.sh  && source $HOME/.abox.sh
      ";
    };
  };
}
