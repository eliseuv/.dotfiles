{ config, pkgs, ... }: {

  home.packages = with pkgs; [ hack-font nerd-fonts.hack ];

  programs.rofi = {
    enable = true;
    font = "Hack Nerd Font 12";
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

  # Copy themes
  home.file = {
    ".config/rofi/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

}
