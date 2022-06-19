self: super:
{
  pinniped = super.callPackage ./pinniped { };
  vault-medusa = super.callPackage ./vault-medusa { };
}
