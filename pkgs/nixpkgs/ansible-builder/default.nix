{ lib, python3Packages }:
let
  bindep = python3Packages.buildPythonPackage rec {
    pname = "bindep";
    version = "2.11.0";
    doCheck = false;

    src = python3Packages.fetchPypi {
      inherit version;
      pname = "bindep";
      sha256 = "sha256-rLLyWbzh/RUIhzR5YJu95bmq5Qg3hHamjWtqGQAufi8=";
    };
    propagatedBuildInputs = [
      python3Packages.pbr
      python3Packages.distro
      python3Packages.packaging
    ];
    postPatch = ''
      rm requirements.txt
    '';
  };
in
python3Packages.buildPythonPackage rec {
  pname = "ansible-builder";
  version = "1.1.0";
  doCheck = false;

  src = python3Packages.fetchPypi {
    inherit version;
    pname = "ansible-builder";
    sha256 = "sha256-RVzWj7SyjHr5b9AM8jv5PM4HGu2u17tfToycSwn5qyA=";
  };
  propagatedBuildInputs = [
    python3Packages.pbr
    python3Packages.pyyaml
    python3Packages.requirements-parser
    bindep
  ];
}
