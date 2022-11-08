##
# Everything to work with kubernetes
##

{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {
    home.packages = with pkgs; [
      # k3s in docker fo local dev
      kube3d
      # Authentification on cluster
      pinniped
      # Check best practices
      polaris
      # Plugin managet
      krew
    ];

    programs = {
      vscode = {
        extensions = with pkgs.vscode-extensions; [
          ms-kubernetes-tools.vscode-kubernetes-tools
        ];
      };
    };
  };
}
