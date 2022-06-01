# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
# let
#   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz";
# in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # (import "${home-manager}/nixos")
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "oldc4"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-sstp
    ];
    dispatcherScripts = [
      {
        source = pkgs.writeText "upHook" ''

          if [ "$2" = "vpn-up" ]; then
            ${pkgs.unixtools.ifconfig}/bin/ifconfig "$1" mtu 1390 up
          fi

    '';
        type = "basic";
      }
    ];
  };
  environment.etc = {
    "NetworkManager/system-connections/work_vpn.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/work_vpn.nmconnection;
      mode = "0600";
    };
    "NetworkManager/system-connections/home_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/home_wifi.nmconnection;
      mode = "0600";
    };
    "NetworkManager/system-connections/work_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/work_wifi.nmconnection;
      mode = "0600";
    };
    "NetworkManager/system-connections/phone_wifi.nmconnection" = {
      user = "root";
      group = "root";
      source = ./etc/phone_wifi.nmconnection;
      mode = "0600";
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  xdg.portal = {
    # need to set enable-webrtc-pipewire-capturer in chrome
    enable = true;
  };


  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    # enableSSHSupport = true;
  };

  # Configure keymap in X11
  services.xserver.layout = "fr";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  virtualisation.docker.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };
  users.defaultUserShell = pkgs.zsh;
  users.users.bpaulin = {
    isNormalUser = true;
    home = "/home/bpaulin";
    description = "bpaulin";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$MDaoHcbuSiJQR83L$unAvaWD6YFLlimJSuKjYBCX8YBN3TWffMHelQBSv0uIZhC/4ISzcnkyKVu.9bbYX4SmTqUt37mQhYFXxpny23/";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    pinentry-gnome
    pinentry
    openssl
  ];
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh.enable = true;
  security.pki.certificateFiles = [
    ./etc/chain_bundle.crt
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nixpkgs.config.allowUnfree = true;

  security.sudo.extraConfig = "
    Defaults env_keep += http_proxy
    Defaults env_keep += https_proxy
    Defaults env_keep += no_proxy
    Defaults env_keep += CURL_NIX_FLAGS
  ";

  home-manager.users.bpaulin = { pkgs, ... }: {
    imports = [ ./home-manager/home.nix ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

