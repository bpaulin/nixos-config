##
# Git config
##
{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      # clone any repo in a predictive path
      ghq
      # clean merged branch
      git-trim
    ];

    programs = {
      git = {
        # Base config
        enable = true;
        userName = "Bruno Paulin";
        userEmail = "brunopaulin@bpaulin.net";

        # Extra config
        extraConfig = {
          "pull" = {
            rebase = false;
          };
          # Path to all my repos
          "ghq" = {
            root = "~/repos";
          };
          "credential" = {
            helper = "store";
          };
          "gpg" = {
            format = "ssh";
          };
        };

        signing = {
          key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTx7CHqLr9A9N63GeyWZRXIxCfZQGLI+PmZhkeoCdWLzTTXUEkQX7nTRz6wX8Gw94TIkcwLglAIToCFH7RwODnkauRdsG42xJUazSiVm2PInp7UFhPkeb+dFVyO6wa1YQWQyCEpH4WnXLBrjNyPQVjv3VRfKQPo9Rv+0v0n+zvC65O8WMPhyAVu2Bc/EUqv+GlXTCaJ/hoB/xiLXTJgFyHzoeo0+UoWirGbQkb7mBvCY2R0YnoNl1dQ6dR2RNbzXpzDERTUw37BJm9XlXyF6TrXc7FFY9cGHp7q2yKzN3nRMmsQJwFfU/WijHCDQetIrJODs3+/4NCWFW+N8JeFMjzEUPN4lA981MRu5bMWc/O/sjpvuT+06V6sUkmuofNvewRxEs4Egw7mbBwVOzmdxD9FcjO+57pRr90EkSgcVyGmUJ1dpcYZPVs7E76NDduJHWN37yzyKAax0vNR4JHtEMLexZ+Sb9ZTXyP7iCgn7GP/vDAPlcE4pLBp/q0hQ3GQis=";
          signByDefault = true;
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
