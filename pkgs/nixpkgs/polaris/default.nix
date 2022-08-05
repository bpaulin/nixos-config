{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec{
  pname = "polaris";
  version = "7.0.1";

  src = fetchFromGitHub {
    owner = "FairwindsOps";
    repo = "polaris";
    rev = "${version}";
    sha256 = "vnAT+MIrXtt2OdsgMeLfMnAxOI+N9sqnARp2XJOie7s=";
  };
  doCheck = false;
  # subPackages = "";
  ldflags = [
    "-s"
    "-w"
    "-X main.Version=${version}"
    "-X main.Commit=${version}"
  ];

  preBuild = ''
    substituteInPlace pkg/config/checks.go \
      --replace 'packr.New("Schemas", "../../checks")' 'packr.New("Schemas", "${placeholder "out"}/share/polaris/checks")'
    substituteInPlace pkg/config/config.go \
      --replace 'packr.New("Config", "../../examples")' 'packr.New("Config", "${placeholder "out"}/share/polaris/examples")'
  '';

  postInstall = ''
    mkdir -p $out/share/polaris/
    cp -r checks $out/share/polaris/checks
    cp -r examples $out/share/polaris/examples
  '';

  vendorSha256 = "GqqZtGGmv0yAofgB3r5gyGYOq7+gkI/C+0UsF+3xOfE=";
}
