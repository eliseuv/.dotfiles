{ pkgs, ... }:
{

  home.packages = with pkgs; [ nerd-fonts.iosevka-term ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "tokyonight";
      font-family = "IosevkaTerm Nerd Font";
      font-size = 10;
      bold-is-bright = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      gtk-titlebar = false;
      gtk-adwaita = false;
      gtk-single-instance = true;
      window-decoration = false;
    };
  };

}
