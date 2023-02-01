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
      jetbrains.idea-community
      gradle
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
          version = "0.47.2023011221";
          sha256 = "0dnb7hnd7cz1iwivxahw54v7k8lw1prk97vw5k9wfsjg192vm1v6";
        }
        {
          name = "vscode-java-dependency";
          publisher = "vscjava";
          version = "0.21.2023011900";
          sha256 = "1k8pnbygkyhphjk6cgigpnjm1i6xdvcapcfgd43s2y5kpyqvia2y";
        }
        {
          name = "vscode-maven";
          publisher = "vscjava";
          version = "0.40.2023011903";
          sha256 = "1h7zxba5px1wi7334fihi75g9wp3pv2462hjzqnnng86jsqx4ccd";
        }
      ];
    };
  };
}
