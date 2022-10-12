let
  pubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjU/2iZwd+fx5pV/VhQWEaS572C6j2Lx9yu3ILiLnID lithium";
in
{
  "testsecret.age".publicKeys = [ pubKey ];
}
