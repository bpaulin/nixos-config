self: super:
{
  pinniped = super.callPackage ./pinniped { };
  vault-medusa = super.callPackage ./vault-medusa { };
  infracost = super.callPackage ./infracost { };
  molecule = super.callPackage ./molecule { };
  ansible-builder = super.callPackage ./ansible-builder { };
  polaris = super.callPackage ./polaris { };
}
