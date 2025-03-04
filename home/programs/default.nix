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

    ./gtk.nix
    ./qt.nix

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
