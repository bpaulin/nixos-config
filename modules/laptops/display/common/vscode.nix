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
            name = "code-spell-checker-french";
            publisher = "streetsidesoftware";
            version = "0.2.3";
            sha256 = "020fr4rm8d3gwvwymrzcj3zfnac6xqchpiwz4gdwdi7sx53c35jw";
          }
          {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "2.10.1";
            sha256 = "03cx684mn0nk47xpm46dly8g0lxars5h46vj41p8nhgsq9429rhm";
          }
          {
            name = "remote-ssh-edit";
            publisher = "ms-vscode-remote";
            version = "0.84.0";
            sha256 = "sha256-33jHWC8K0TWJG54m6FqnYEotKqNxkcd/D14TFz6dgmc=";
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
