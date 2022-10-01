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
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "code-spell-checker-french";
            publisher = "streetsidesoftware";
            version = "0.2.2";
            sha256 = "14kin9nn1nq9q2p3n927rcg41idjxmpq2cz63rg6hwa55384n82r";
          }
          {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "2.3.4";
            sha256 = "0h19j3017k30jh6qvjazsggj6pajp9ps6smvnphwasxmjji1mjbj";
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
        };
      };
    };
  };
}
