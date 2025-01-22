{ config, pkgs, ... }: {
  imports = [
    ./programs/shell/flake.nix
    ./programs/terminal/ghostty/flake.nix
    ./programs/editors/neovim/flake.nix
    ./programs/editors/emacs/flake.nix
    ./programs/editors/helix/flake.nix
    ./programs/editors/zed/flake.nix
    ./programs/browsers/firefox/flake.nix
    ./programs/browsers/chromium/flake.nix
    ./programs/browsers/brave/flake.nix
    ./programs/communication/telegram/flake.nix
    ./programs/communication/discord/flake.nix
    ./programs/documents/zathura/flake.nix
    ./programs/media/sxiv/flake.nix
    ./programs/media/ncmpcpp/flake.nix
    ./programs/media/mpv/flake.nix
    ./programs/media/spotify/flake.nix
    ./desktops/xmonad/flake.nix
    ./languages/rust.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [ cryptsetup udiskie nautilus ];

  fonts.fontconfig.enable = true;

  # Image viewer
  programs.feh = { enable = true; };

  services = {

    # Automount volumes
    udiskie = {
      enable = true;
      automount = true;
      tray = "never";
      settings = {
        program_options = {
          # https://github.com/nix-community/home-manager/issues/632#issuecomment-2210425312
          file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
        };
      };
    };

    # File syncronization
    syncthing = { enable = true; };

  };

  programs.ssh = {
    enable = true;
    compression = true;
    addKeysToAgent = "yes";
    forwardAgent = true;
    serverAliveInterval = 240;
    matchBlocks = {
      # Alpine Linux VM
      "alpine-vm" = {
        hostname = "alpine-vm.local";
        user = "evf";
      };
      # Personal computer at IF-UFRGS
      "if-ufrgs" = {
        hostname = "143.54.45.50";
        user = "evf";
        proxyJump = "alpine-vm";
      };
      # LIEF
      "lief" = {
        hostname = "lief.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
      # Ada Lovelace cluster
      "lovelace" = {
        hostname = "lovelace.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
      # Ada Lovelace cluster
      "ada" = {
        hostname = "lovelace.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
    };
  };

  programs.gpg = {
    enable = true;
    settings = { };
  };
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 3600;
    defaultCacheTtlSsh = 3600;
    maxCacheTtlSsh = 3600;
    pinentryPackage = pkgs.pinentry-gtk2;
  };

  # Git
  programs.git = {
    enable = true;
    userName = "evf";
    userEmail = "eliseuv816@gmail.com";
    delta.enable = true;
  };
  home.shellAliases = {
    git-push = ''git add .; git commit -m "update"; git push'';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
}
