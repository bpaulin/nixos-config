##
# Git config
##
{ ... }:
{
  home-manager.users.bpaulin = { pkgs, config, ... }: {

    home.packages = with pkgs; [
      # clone any repo in a predictive path
      git-get
      # clean merged branch
      git-trim
    ];

    programs = {
      git = {
        # Base config
        enable = true;

        # Extra config
        extraConfig = {
          "pull" = {
            rebase = false;
          };
          # Path to all my repos
          "gitget" = {
            root = "~/repos";
          };
          "credential" = {
            helper = "store";
          };
          "gpg" = {
            format = "ssh";
          };
          "commit" = {
            gpgSign = true;
          };
          user = {
            name = "Bruno Paulin";
            email = "brunopaulin@bpaulin.net";
            signingKey = config.id_pub.bpaulin;
          };
        };

        # Better looking diff
        delta = {
          enable = true;
          options = {
            light = false;
            navigate = true;
          };
        };

        # Patterns i want to ignore across repositories
        ignores = [
          "bpignore*"
        ];

        # Git aliases
        aliases = {
          # Add
          a = "add";

          # Diff
          d = "diff";
          # Diff (staged files)
          ds = "diff --staged";
          # Diff (last commit)
          dl = "diff HEAD^";

          # Branch
          b = "branch --verbose";

          # Checkout
          co = "checkout";
          # Checkout (on new branch)
          nb = "checkout -b";

          # Status
          st = "status --short --branch";

          # Show
          sh = "show --stat --abbrev-commit";

          # Log
          l = "log --reverse --max-count=5 --abbrev-commit";
          # Log (graphical)
          lg = "log --pretty=oneline --max-count=20 --graph --abbrev-commit";
          # Log (graphical with branches)
          lb = "log --pretty=oneline --max-count=20 --graph --abbrev-commit --all --decorate";
          # Log (unpushed commits)
          lu = "log --branches --not --remotes --decorate --oneline";

          # Commit
          c = "commit";
          # Commit (with message)
          cm = "commit -m";
          # Commit (add all files and display full diff)
          ca = "!git add --all && git commit --all --verbose";
          # Commit (amend)
          amend = "commit --amend";

          # unstage
          unstage = "reset HEAD";
          # uncommit
          uncommit = "reset --soft HEAD^";
          # discard
          discard = "reset --hard";

          # Pull
          p = "pull";
          # Pull (with submodules)
          ps = "!'git pull; git submodule foreach git pull origin master'";

          # fetch
          f = "fetch --prune --all";

          # prune local
          prunelocal = "!'git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d'";
        };
      };
    };
  };
}
