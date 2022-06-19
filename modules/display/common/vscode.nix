{ pkgs, ... }:
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
        };
      };
    };
  };
}
