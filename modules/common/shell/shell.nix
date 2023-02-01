##
# Shell (zsh) config
##
{ ... }:
{
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # json/yaml
      dyff
      yq-go
      fx
      # network tools
      curl
      wget
      httpie
      ldns
      bind
      openssl
      nssTools
      mtr
      # disk
      ncdu
      duf
      # archive
      dtrx
      unzip
      p7zip
      # mess
      neofetch
      thefuck
      tree
      envsubst
      glow
      ripgrep
      tldr
      exa
      glances
      psmisc
      go-task
      pwgen
    ];

    programs = {
      starship = {
        enable = true;
        settings = { };
      };
      bat = {
        enable = true;
      };
      jq.enable = true;
      htop.enable = true;
      direnv.enable = true;
      tmux.enable = true;
      autojump.enable = true;
      fzf.enable = true;
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        enableCompletion = true;
        initExtra = "
        eval $(thefuck --alias)
          ";
        initExtraBeforeCompInit = ''
          fpath+="/nix/var/nix/profiles/per-user/bpaulin/profile/share/zsh/site-functions"
        '';
      };
    };

    home = {
      sessionPath = [
        "$HOME/.local/bin"
      ];
      shellAliases = {
        cat = "bat --paging=never";
      };
      shellAliases = {
        ls = "exa";
      };
    };
  };
}


