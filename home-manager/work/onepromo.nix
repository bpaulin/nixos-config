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
