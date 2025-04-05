{ ... }: {

  imports = [ ./ghostty.nix ./kitty.nix ];

  # Default terminal
  home.sessionVariables = { TERMINAL = "kitty"; };

}
