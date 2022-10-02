{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      terraform
      terraform-ls
      tfk8s
      infracost
      tfsec
      tflint
      terrascan
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
        ];
      };
    };
  };
}


