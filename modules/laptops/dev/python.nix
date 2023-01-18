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
      GitPython
      black
      jinja2
      scrapy
      aiohttp
      cryptography
      jmespath
      ansible-core
      hvac
      boto3
      openshift
      psycopg
      elasticsearch
      redis
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      python-with-my-packages
      yamllint
      pur
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
