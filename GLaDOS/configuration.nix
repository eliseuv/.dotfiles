# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  # Not using 'pkgs.fetchgit' because as that would cause an infinite recursion
  nix-gc-env = builtins.fetchGit {
    url = "https://github.com/Julow/nix-gc-env";
    rev = "4753f3c95891b711e29cb6a256807d22e16cf9cd";
  };
in
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${nix-gc-env}/nix_gc_env.nix")
    ];

  # Nix Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    delete_generations = "+8";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "GLaDOS"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.displayManager.defaultSession = "none+xmonad";
  services.xserver.displayManager = {
    lightdm.enable = true;
    sessionCommands = ''
      ${pkgs.xorg.xrandr}/bin/xrandr \
        --output HDMI-1 --primary --mode 1920x1080 --rate 240 --pos 1080x1080 --rotate normal \
        --output DP-2 --mode 2560x1080 --rate 75 --pos 440x0 --rotate normal \
        --output DP-3 --mode 1920x1080 --pos 0x1080 --rotate left \
        --output DP-1 --off \
        --output DP-2 --off \
        --output DP-4 --off \
    '';
  };


  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # # Enable the GNOME Desktop Environment.
    # displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;

    # XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [
        hpkgs.xmobar
      ];
    };

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.evf = {
    isNormalUser = true;
    description = "evf";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Text editor
    vim

    # Keyboard options
    kanata

    # XMonad bar
    xmobar
  ];

  # Use ZSH
  programs.zsh.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Start SSH agent
  programs.ssh.startAgent = true;

  # Apply custom keyboard config
  services.kanata = {
    enable = true;
    keyboards = {
      "hyper".config = ''
        (defsrc
          caps
        )

        (deflayer base
          esc
        )
      '';
    };
  };

  services.udisks2.enable = true;

  # Virtual Machines
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  users.groups.libvirtd.members = [ "evf" ];
  virtualisation.spiceUSBRedirection.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
