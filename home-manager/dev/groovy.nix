{ pkgs, ... }:
{
  home.packages = with pkgs; [
    groovy
  ];

  programs = {
    vscode = {
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-groovy-lint";
          publisher = "NicolasVuillamy";
          version = "1.9.0";
          sha256 = "sha256-ZbOC09Ispw/nld8pSmtW8K9PPg10FkN27dTa1Or3DdI=";
        }
      ];
    };
  };
}

# let
#   extensions = (with pkgs.vscode-extensions; [
#     bbenoist.nix
#     ms-python.python
#     ms-azuretools.vscode-docker
#     ms-vscode-remote.remote-ssh
#   ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
#     name = "vscode-groovy-lint";
#     publisher = "NicolasVuillamy";
#     version = "1.9.0";
#     sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
#   }];
#   vscode-with-extensions = pkgs.vscode-with-extensions.override {
#     vscodeExtensions = extensions;
#   };
# in
# {
#   config = {
#     environment.systemPackages = [
#       vscode-with-extensions
#     ];
#   };
# }
