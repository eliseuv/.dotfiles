{ pkgs, lib, ... }: {

  # Nix scripts
  home.packages = [
    # Test script
    (import ./my-awesome-script.nix { inherit pkgs; })
    # ripgrep fzf
    (import ./rgfzf.nix {
      inherit pkgs;
      inherit lib;
    })
  ];

  home.shellAliases = {
    # ripgrep + fzf
    f = "rgfzf";
  };

  # # Shell scripts
  # home.sessionPath = [ "$HOME/.local/bin" ];
  # home.file = {
  #   ".local/bin" = {
  #     source = ./scripts/shell;
  #     recursive = true;
  #   };
  # };

}
