{ pkgs, ... }: {
  imports = [

    # Terminal emulators
    ./terminal/default.nix

    # Text editors
    ./editor/default.nix

    # Web browsers
    ./browser/default.nix

    # Documents
    ./documents/default.nix

    # Media
    ./media/default.nix

    # Social
    ./social/default.nix

    # GTK config
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

}
