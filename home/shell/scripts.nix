{ pkgs, ... }: {

  # Nix scripts
  home.packages = [
    # Test script
    (import ./scripts/my-awesome-script.nix { inherit pkgs; })
  ];

  # # Shell scripts
  # home.sessionPath = [ "$HOME/.local/bin" ];
  # home.file = {
  #   ".local/bin" = {
  #     source = ./scripts/shell;
  #     recursive = true;
  #   };
  # };

}
