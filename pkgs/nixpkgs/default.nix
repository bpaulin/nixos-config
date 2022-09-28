self: super:
{
  molecule = super.callPackage ./molecule { };
  ansible-builder = super.callPackage ./ansible-builder { };
  polaris = super.callPackage ./polaris { };
}
