{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec{
  pname = "pinniped";
  version = "0.18.0";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "pinniped";
    rev = "v${version}";
    sha256 = "S3JTxHeZ0QrhtakIaTOoQGU08qwjva8qcu2Bef+kMrA=";
  };

  subPackages = "cmd/pinniped";

  vendorSha256 = "V36b6x+wz5MeJzp/GPhX2sPATosOMEqGkeQdz4RbiEQ=";

  meta = with lib; {
    description = "Tool to securely log in to your Kubernetes clusters";
    homepage = "https://pinniped.dev/";
    license = licenses.asl20;
    maintainers = with maintainers; [ "bpaulin" ];
  };
}
