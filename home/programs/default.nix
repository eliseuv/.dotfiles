{ pkgs, ... }: {
  imports = [

    # Terminal emulators
    ./terminal/ghostty.nix
    ./terminal/kitty.nix

    # Text editors
    ./editor/default.nix

    # Web browsers
    ./browser/brave.nix
    ./browser/chromium.nix
    ./browser/firefox.nix

    # Documents
    ./documents/calibre.nix
    ./documents/zathura.nix

    # Media
    ./media/feh.nix
    ./media/mpv.nix
    ./media/ncmpcpp.nix
    ./media/spotify.nix
    ./media/sxiv.nix

    # Social
    ./social/discord.nix
    ./social/telegram.nix

    # GTK Config
    ./gtk.nix
  ];

  home.packages = with pkgs; [

    # File manager
    nautilus

    # Encryption
    veracrypt

    # Calculator
    speedcrunch

  ];

  # Default terminal
  home.sessionVariables = { TERMINAL = "ghostty"; };

}
