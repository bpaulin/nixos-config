{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        yzhang.markdown-all-in-one
        eamodio.gitlens
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
      };
    };
  };
}
