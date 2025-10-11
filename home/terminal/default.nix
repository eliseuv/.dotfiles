{ ... }:
{

  imports = [
    ./ghostty.nix
    ./kitty.nix
  ];

  # Default terminal
  home.sessionVariables = {
    TERMINAL = "kitty";
    TERM = "xterm-kitty";
  };

}
