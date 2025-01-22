{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Simple calculator
    bc
    # JSON parser
    jq
    # Audio
    pulsemixer

    # Fonts
    fira-code
    nerd-fonts.fira-code
    ubuntu-classic
    nerd-fonts.ubuntu
    hack-font
    nerd-fonts.hack
  ];

  # Menu
  programs.rofi = {
    enable = true;
    font = "hack 12";
    extraConfig = {
      modi = "combi";
      combi-modi = "window,drun,ssh";
      kb-remove-char-forward = "Delete";
      kb-remove-char-back = "BackSpace,Shift+BackSpace";
      kb-remove-to-eol = "Control+d";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-mode-complete = "Control+l";
      kb-row-left = "Control+h";
      kb-row-up = "Up,Control+k,Control+p";
      kb-row-down = "Down,Control+j,Control+n";
    };
    terminal = "ghostty";
    theme = "tokyonight";
  };

}
