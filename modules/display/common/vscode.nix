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
            version = "0.2.1";
            sha256 = "sha256-VKFzWKYHSzL2Tye6rFbmqcpcGK4T5Zutu/ZWOwVpec8=";
          }
          {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "2.2.5";
            sha256 = "sha256-QDLK99ja1Bb3Lxhde12O1ezdMfEAyFZNb6yKNeCn0Cs=";
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
