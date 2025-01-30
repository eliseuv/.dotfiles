{ pkgs, ... }: {

  # Nix scripts
  home.packages = [
    # Test script
    (import ./my-awesome-script.nix { inherit pkgs; })
  ];

  # Shell scripts
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.file = {
    ".local/bin" = {
      source = ./shell;
      recursive = true;
    };
  };

}
