_self: super:
{
  # merged on nixpkgs \o/
  # pinniped = super.callPackage ./pinniped { };
  # vault-medusa = super.callPackage ./vault-medusa { };
  infracost = super.callPackage ./infracost { };
  molecule = super.callPackage ./molecule { };
  ansible-builder = super.callPackage ./ansible-builder { };
  polaris = super.callPackage ./polaris { };
  git-get = super.callPackage ./git-get { };
  krew = super.callPackage ./krew { };
}
