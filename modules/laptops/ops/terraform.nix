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
            sha256 = "sha256-gIzdcDpvTDhGwTOGBrbY8Y2BAa/n5qrazFNwwFcBc28=";
          }
        ];
      };
    };
  };
}


