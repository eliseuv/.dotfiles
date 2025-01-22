{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight";
      font-family = "IosevkaTerm Nerd Font";
      font-size = 10;
      bold-is-bright = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      # gtk-single-instance = true;
      # adw-toolbar-style = "raised";
      # window-decoration = false;
    };
  };

}
