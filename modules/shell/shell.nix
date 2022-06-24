##
# Shell (zsh) config
##
{ pkgs, lib, ... }:
{
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # nerdfonts # too many
      dyff
      yq
      curl
      ldns
      bind
      openssl
      nssTools
      neofetch
      thefuck
      tree
      ncdu
      dtrx
      unzip
      envsubst
      glow
      ripgrep
      tldr
      httpie
      duf
      exa
      glances
      fx
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


