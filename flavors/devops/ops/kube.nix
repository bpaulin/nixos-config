{ pkgs, ... }:
let
  helm-with-plugins = pkgs.wrapHelm pkgs.kubernetes-helm {
    plugins = with pkgs.kubernetes-helmPlugins; [
      helm-diff
    ];
  };
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      kubectl
      kubectx
      k9s
      helm-with-plugins
      helmfile
      # pinniped
      kube-prompt
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          redhat.vscode-yaml
          ms-kubernetes-tools.vscode-kubernetes-tools
        ];
      };
    };
  };
}
