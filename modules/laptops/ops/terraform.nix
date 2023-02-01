{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      terraform
      terraform-ls
      tfk8s
      infracost
      tfsec
      trivy
      driftctl
      tflint
      terrascan
      terraform-docs
      terraformer
      terragrunt
    ];

    programs = {
      vscode = {
        userSettings = {
          "terraform.languageServer" = {
            "external" = true;
            "pathToBinary" = "${pkgs.terraform-ls}/bin/terraform-ls";
            "args" = [
              "serve"
            ];
            "maxNumberOfProblems" = 100;
            "trace.server" = "off";
          };
        };
        extensions = with pkgs.vscode-extensions; [
          hashicorp.terraform
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "tfsec";
            publisher = "tfsec";
            version = "1.11.0";
            sha256 = "0vvk05bw0w2krkdamrp7mw0q33giv2v0d1ikq533hk3g79qdv340";
          }
        ];
      };
    };
  };
}


