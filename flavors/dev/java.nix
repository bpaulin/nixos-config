{ pkgs, ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      maven
      lombok
    ];

    programs.java.enable = true;

    programs.vscode = {
      userSettings = {
        "java.configuration.runtimes" = [
          {
            name = "JavaSE-17";
            path = "${pkgs.jdk}/lib/openjdk";
            default = true;
          }
        ];
        "java.jdt.ls.java.home" = "${pkgs.jdk}/lib/openjdk";
        "files.exclude" = {
          "**/.classpath" = true;
          "**/.project" = true;
          "**/.settings" = true;
          "**/.factorypath" = true;
        };
        "java.jdt.ls.vmargs" = "-javaagent:${pkgs.lombok}/share/java/lombok.jar";
      };
      extensions = with pkgs.vscode-extensions; [
        redhat.java
        dotjoshjohnson.xml
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-java-debug";
          publisher = "vscjava";
          version = "0.41.0";
          sha256 = "sha256-QSaBXTWXjlIDiw1Uuox8LvSuJ9lwMPNcY3vdcMA5+3g=";
        }
        {
          name = "vscode-maven";
          publisher = "vscjava";
          version = "0.35.2";
          sha256 = "sha256-wmztK8QyNPPNQPmpta3dBcwyfKexoaskSM/04ILXLf8=";
        }
        {
          name = "vscode-java-dependency";
          publisher = "vscjava";
          version = "0.19.1";
          sha256 = "sha256-zCCmIKdad5wSETEb6WmZ19KLToWiUMzdCpTVMAZRLnk=";
        }
        # {
        #   name = "vscode-lombok";
        #   publisher = "GabrielBB";
        #   version = "1.0.1";
        #   sha256 = "sha256-xhsdP51vKiem4Q0WgdX5PlmGPsg9Khqw1qL5YdW5h8E=";
        # }
      ];
    };
  };
}
