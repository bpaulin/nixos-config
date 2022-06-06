{ pkgs, ... }:
with pkgs;
let
  my-python-packages = python-packages:
    with python-packages; [
      requests
      tabulate
      click
      loguru
      pyyaml
      atlassian-python-api
      python-slugify
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      python-with-my-packages
      black
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          ms-python.python
        ];
      };
    };
  };
}
