{ config, pkgs, ... }: {

  imports = [
    ./modules/ssh.nix
    ./modules/gpg.nix
    ./modules/git.nix
    ./modules/files.nix
    ./modules/tools.nix
    ./modules/syncthing.nix
    ./modules/languages/nix.nix
    ./modules/languages/rust.nix
    ./modules/languages/haskell.nix
    ./modules/languages/c.nix
    ./modules/languages/go.nix
    ./modules/languages/zig.nix
    ./modules/languages/python.nix
    ./modules/languages/fortran.nix
    ./modules/languages/julia.nix
    ./modules/languages/ocaml.nix
    ./modules/languages/lean.nix
    ./modules/languages/web.nix
    ./scripts/flake.nix
    ./programs/shell/flake.nix
    ./programs/terminal/ghostty/flake.nix
    ./programs/editors/neovim/flake.nix
    ./programs/editors/emacs/flake.nix
    ./programs/editors/helix/flake.nix
    ./programs/editors/zed/flake.nix
    ./programs/browsers/firefox/flake.nix
    ./programs/browsers/chromium/flake.nix
    ./programs/browsers/brave/flake.nix
    ./programs/documents/zathura/flake.nix
    ./programs/documents/calibre/flake.nix
    ./programs/media/feh/flake.nix
    ./programs/media/sxiv/flake.nix
    ./programs/media/ncmpcpp/flake.nix
    ./programs/media/mpv/flake.nix
    ./programs/media/spotify/flake.nix
    ./programs/communication/telegram/flake.nix
    ./programs/communication/discord/flake.nix
    ./desktops/xmonad/flake.nix
    ./desktops/hyprland/flake.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  nix.gc = {
    automatic = true;
    frequency = "daily";
    options = "--delete-older-than 7d";
  };

  home.stateVersion = "24.11";
}
