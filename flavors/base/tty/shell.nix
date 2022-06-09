{ pkgs, lib, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      nerdfonts # too many
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
    ];

    home =
      {
        sessionPath = [
          "$HOME/.local/bin"
        ];
        shellAliases = {
          cat = "bat --paging=never";
        };
      };

    programs = {
      starship.enable = true;
      bat = {
        enable = true;
      };
      jq.enable = true;
      htop.enable = true;
      direnv.enable = true;
      tmux.enable = true;
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        initExtra = "
        eval $(thefuck --alias)
          ";
      };
    };
  };
}


