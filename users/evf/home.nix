{ config, pkgs, ... }: {

  imports = [
    ./ssh.nix
    ./gpg.nix
    ./git.nix
    ./files.nix
    ../../desktops/xmonad/flake.nix
    ../../desktops/hyprland/flake.nix
    ../../programs/shell/flake.nix
    ../../programs/terminal/ghostty/flake.nix
    ../../programs/editors/neovim/flake.nix
    ../../programs/editors/emacs/flake.nix
    ../../programs/editors/helix/flake.nix
    ../../programs/editors/zed/flake.nix
    ../../programs/browsers/firefox/flake.nix
    ../../programs/browsers/chromium/flake.nix
    ../../programs/browsers/brave/flake.nix
    ../../programs/documents/zathura/flake.nix
    ../../programs/media/feh/flake.nix
    ../../programs/media/sxiv/flake.nix
    ../../programs/media/ncmpcpp/flake.nix
    ../../programs/media/mpv/flake.nix
    ../../programs/media/spotify/flake.nix
    ../../programs/communication/telegram/flake.nix
    ../../programs/communication/discord/flake.nix
    ../../languages/rust.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };

  home.stateVersion = "24.11";
}
