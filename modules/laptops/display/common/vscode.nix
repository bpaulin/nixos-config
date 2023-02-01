{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    programs = {
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          redhat.vscode-yaml
          yzhang.markdown-all-in-one
          eamodio.gitlens
          github.vscode-pull-request-github
          marp-team.marp-vscode
          ms-vscode-remote.remote-ssh
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "2.14.0";
            sha256 = "0473vlyni3kz09xbw1bk0zzz685lyi9n3qvyga6ajnk60g9i1xqf";
          }
          {
            name = "code-spell-checker-french";
            publisher = "streetsidesoftware";
            version = "0.2.4";
            sha256 = "1hjar1nrdhmykf9pvqbjxa000qp0khlq74x3z564gm8vqnvnxrq2";
          }
        ];
        userSettings = {
          "terminal.integrated.fontFamily" = "Source Code Pro";
          "files.insertFinalNewline" = true;
          "files.autoSave" = "onFocusChange";
          "files.trimTrailingWhitespace" = true;
          "scm.defaultViewMode" = "tree";
          "terminal.integrated.scrollback" = 10000;
          "editor.bracketPairColorization.enabled" = true;
          "diffEditor.ignoreTrimWhitespace" = false;
          "window.openFoldersInNewWindow" = "on";
          "workbench.startupEditor" = "none";
          "window.titleBarStyle" = "custom";
          "git.autofetch" = true;
        };
      };
    };
  };
}
