{ lib, python3Packages }:
let
  cerberus = python3Packages.buildPythonPackage rec {
    pname = "cerberus";
    version = "1.3.2";
    doCheck = false;

    src = python3Packages.fetchPypi {
      inherit version;
      pname = "Cerberus";
      sha256 = "sha256-MC5mlPIG3YXLY/E/1QJbMattOMmcUMbXafj6Cw8plYk=";
    };
  };
in
python3Packages.buildPythonPackage rec {
  pname = "molecule";
  version = "3.6.1";
  doCheck = false;
  format = "pyproject";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-O31bopeMFaA034x6pZ3sVDb30yYNH52yx4rhSuOp3us=";
  };
  propagatedBuildInputs = [
    python3Packages.enrich
    python3Packages.ansible-compat
    python3Packages.packaging
    python3Packages.click-help-colors
    python3Packages.jinja2
    python3Packages.paramiko
    python3Packages.cookiecutter
    python3Packages.pluggy
    python3Packages.setuptools
    cerberus
  ];
  nativeBuildInputs = [ python3Packages.setuptools-scm ];
  SETUPTOOLS_SCM_PRETEND_VERSION = version;
}
