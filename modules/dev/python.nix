{ pkgs, ... }:
with pkgs;
let

  bindep = pkgs.python39Packages.buildPythonPackage rec {
    pname = "bindep";
    version = "2.11.0";
    doCheck = false;

    src = pkgs.python39Packages.fetchPypi {
      inherit version;
      pname = "bindep";
      sha256 = "sha256-rLLyWbzh/RUIhzR5YJu95bmq5Qg3hHamjWtqGQAufi8=";
    };
    propagatedBuildInputs = [
      python39Packages.pbr
      python39Packages.distro
      python39Packages.packaging
    ];
    postPatch = ''
      rm requirements.txt
    '';
  };

  ansible-builder = pkgs.python39Packages.buildPythonPackage rec {
    pname = "ansible-builder";
    version = "1.1.0";
    doCheck = false;

    src = pkgs.python39Packages.fetchPypi {
      inherit version;
      pname = "ansible-builder";
      sha256 = "sha256-RVzWj7SyjHr5b9AM8jv5PM4HGu2u17tfToycSwn5qyA=";
    };
    propagatedBuildInputs = [
      python39Packages.pbr
      python39Packages.pyyaml
      python39Packages.requirements-parser
      bindep
    ];
  };

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
      # bindep
      # ansible-builder
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      python-with-my-packages
      yamllint
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
