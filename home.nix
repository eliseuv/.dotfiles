{ config, pkgs, ... }:

{
  imports = [
    ./xmonad.nix
    ./ghostty.nix
    ./tmux.nix
    ./sh.nix
    ./ssh-gpg.nix
    ./neovim.nix
    ./rust.nix
    ./ncmpcpp.nix
    ./emacs.nix
    ./zed.nix
    ./firefox.nix
    ./fastfetch.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Disks
    cryptsetup
    udiskie
    # File manager
    nautilus
    # Web browsers
    brave
    chromium
    # Image viewer
    sxiv
    # Telegram
    telegram-desktop
    # Music
    spotify
  ];

  fonts.fontconfig.enable = true;

  # Another terminal multiplexer
  programs.zellij = {
    enable = true;
    settings = { theme = "Catppuccin Mocha"; };
  };

  # PDF reader
  programs.zathura = {
    enable = true;
    mappings = { "<C-i>" = "recolor"; };
    extraConfig = ''
      set recolor true
    '';
  };

  # Image viewer
  programs.feh = { enable = true; };

  # Video player
  programs.mpv = {
    enable = true;
    bindings = {
      "Alt+=" = "add video-zoom 0.1";
      "Alt+-" = "add video-zoom -0.1";
      "-" = "add volume -2";
      "=" = "add volume 2";
    };
    config = {
      hwdec = "auto";
      ytdl-raw-options = "force-ipv4=";
    };
    scripts = [ pkgs.mpvScripts.thumbfast pkgs.mpvScripts.mpv-playlistmanager ];
  };

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

  # Mime apps
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "sxiv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
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
