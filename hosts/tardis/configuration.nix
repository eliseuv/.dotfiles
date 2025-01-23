{ config, pkgs, lib, ... }:
let
  # Not using 'pkgs.fetchgit' because as that would cause an infinite recursion
  nix-gc-env = builtins.fetchGit {
    url = "https://github.com/Julow/nix-gc-env";
    rev = "4753f3c95891b711e29cb6a256807d22e16cf9cd";
  };
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware.nix
    # Nix GC
    (import "${nix-gc-env}/nix_gc_env.nix")
  ];

  options = {
    wm = lib.mkOption {
      type = lib.types.enum [ "xmonad" "hyprland" ];
      default = "xmonad";
    };
  };

  config = {

    # Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Automatic garbage collection
    nix.gc = {
      automatic = true;
      dates = "daily";
      delete_generations = "+8";
    };

    # Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Disk encryption
    boot.initrd.luks.devices."luks-2ac9cd27-6ff4-4407-9808-c63a5251c44c".device =
      "/dev/disk/by-uuid/2ac9cd27-6ff4-4407-9808-c63a5251c44c";

    # Networking
    networking.hostName = "tardis"; # Define your hostname.
    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Locale
    time.timeZone = "America/Sao_Paulo";
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

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Audio
    services.pulseaudio.enable = false;
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
      packages = with pkgs; [ ];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      # Text editor
      vim

      # Controll brightness
      brightnessctl

      # Keyboard config
      kanata
    ];

    # Use ZSH
    environment.shells = with pkgs; [ zsh ];
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # Install firefox.
    programs.firefox.enable = true;

    # Enable SSH agent
    programs.ssh.startAgent = true;

    # Keyboard configuration
    services.kanata = {
      enable = true;
      keyboards = {
        "onboard".config = ''
          (defsrc
            caps
          )
          (deflayer base
            esc
          )
        '';
      };
    };

    # Automount
    services.udisks2.enable = true;

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

  };

}
