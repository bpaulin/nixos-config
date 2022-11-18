# until https://github.com/NixOS/nixpkgs/pull/201229/commits/808095530a618c70e81c9f2423273860cfbed4d0 is on master
final: prev: {
  gnome = prev.gnome // {
    gnome-keyring = (prev.gnome.gnome-keyring.override {
      glib = prev.glib.overrideAttrs (a: rec {
        patches = a.patches ++ [
          (final.fetchpatch {
            url =
              "https://gitlab.gnome.org/GNOME/glib/-/commit/2a36bb4b7e46f9ac043561c61f9a790786a5440c.patch";
            sha256 = "b77Hxt6WiLxIGqgAj9ZubzPWrWmorcUOEe/dp01BcXA=";
          })
        ];
      });
    });
  };
}
