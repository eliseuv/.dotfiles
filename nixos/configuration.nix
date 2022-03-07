# NixOS /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "inspiron17";
    
    wireless = {
      enable = false;
      userControlled.enable = true;
    };

    networkmanager.enable = true;

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    useDHCP = false;
    interfaces.enp7s0f1.useDHCP = true;
    #interfaces.wlp6s0.useDHCP = true;

    # Configure network proxy if necessary
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    #firewall.allowedTCPPorts = [ ... ];
    #firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    #firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver = {

    enable = true;

    # Enable the GNOME 3 Desktop Environment.
    #displayManager.gdm.enable = true;
    #desktopManager.gnome3.enable = true;
 
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+qtile";
    };

    windowManager = {
      qtile.enable = true;
      xmonad.enable = true;      
      xmonad.enableContribAndExtras = true;
      xmonad.extraPackages = hpkgs: [
        hpkgs.xmonad
        hpkgs.xmonad-contrib
        hpkgs.xmonad-extras
      ];
    };

    # Configure keymap in X11
    layout = "us";
    #xkbOptions = "eurosign:e";

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.evf = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Terminal
    alacritty
    # Tools
    networkmanager
    wget git
    # Editors
    vim emacs
    # GUI Programs
    firefox
    vscode
    # XMonad
    xmobar
    nitrogen
    picom
    dmenu
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
