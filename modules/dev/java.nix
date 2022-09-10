##
# Java toolbox
##
{ pkgs, ... }:
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
          version = "0.43.2022080507";
          sha256 = "1s1ksy5dn4dckn4kbyb3nx5mgchrx76i7gs4kmc3zypnwgjzvqia";
        }
        {
          name = "vscode-maven";
          publisher = "vscjava";
          version = "0.37.2022072603";
          sha256 = "1dxjjprn2s3mq2wybaz90fa4rx429v2ppnv5yg6ana4r8hmjyh1r";
        }
        {
          name = "vscode-java-dependency";
          publisher = "vscjava";
          version = "0.21.2022080500";
          sha256 = "1p66lm3yn2jjv1yiy1d06p3icrac17gqgfzgpgi38krvdzakf04g";
        }
      ];
    };
  };
}
