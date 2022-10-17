##
# Java toolbox
##
{ ... }:
{
  home-manager.users.bpaulin = { pkgs, ... }: {

    home.packages = with pkgs; [
      maven
      lombok
      # eclipses.eclipse-jee
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
          version = "0.45.2022101323";
          sha256 = "0lhkbpdpmykmy68d1sd3q4a23w0ms70yp24wfnbb2bm83dmzgm0a";
        }
        {
          name = "vscode-java-dependency";
          publisher = "vscjava";
          version = "0.21.2022101300";
          sha256 = "06kl990yq5xyqq4407q7wgb39wr1q5kjlc4m1gi4bjsfnxadx4l9";
        }
        {
          name = "vscode-maven";
          publisher = "vscjava";
          version = "0.39.0";
          sha256 = "1603s2s9abg1pqfakj43zp3dfl0y92pblra85wj2rccbzf3asba3";
        }
      ];
    };
  };
}
