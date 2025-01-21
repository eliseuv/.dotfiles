{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    iosevka
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight";
      font-family = "Iosevka Nerd Font";
      font-size = 10;
      bold-is-bright = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      title = "ghostty";
      class = "ghostty";
      gtk-single-instance = true;
      adw-toolbar-style = "raised";
      window-decoration = false;
    };
  };

}

