{ pkgs, ... }:
with pkgs;
let
  my-ruby-packages = ruby-packages:
    with ruby-packages; [
      github-pages
    ];
  ruby-with-my-packages = ruby.withPackages my-ruby-packages;
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      ruby-with-my-packages
      bundix
    ];
  };
}
