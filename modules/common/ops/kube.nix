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
      # Colors for kubectl
      kubecolor
    ];

    home = {
      shellAliases = {
        # always colorize kubectl output
        kubectl = "kubecolor";
      };
    };

    programs = {
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
      neovim = {
        plugins = with pkgs.vimPlugins; [
          vim-helm
        ];
      };
    };

  };
}
