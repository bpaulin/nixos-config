##
# Everything to work with kubernetes
##

{ pkgs, ... }:
let

  helm-with-plugins = pkgs.wrapHelm pkgs.kubernetes-helm {
    plugins = with pkgs.kubernetes-helmPlugins;
      [
        # allow helmfile diff
        helm-diff
      ];
  };
in
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # Kubernetes cli
      kubectl
      # Interactive cli
      kube-prompt
      # Cluster/namespace switcher
      kubectx
      # Terminal UI
      k9s
      # Helm deployments
      helm-with-plugins
      helmfile
      # To see logs of several pods
      kubetail
      # k3s in docker fo local dev
      kube3d
      # Colors for kubectl
      kubecolor
      # Authentification on cluster
      pinniped
      # Check best practices
      kube-score
    ];

    home = {
      shellAliases = {
        # always colorize kubectl output
        kubectl = "kubecolor";
      };
    };

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          ms-kubernetes-tools.vscode-kubernetes-tools
        ];
      };

      starship = {
        settings = {
          kubernetes = {
            disabled = false;
            context_aliases = {
              "gke_.*_(?P<var_cluster>[\\\\w-]+)" = "gke-$var_cluster";

            };
          };
        };
      };
    };
  };
}
