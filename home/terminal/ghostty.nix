{ pkgs, ... }:
{

  home.packages = with pkgs; [ nerd-fonts.iosevka-term ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    settings = {
      theme = "tokyonight";
      font-family = "IosevkaTerm Nerd Font";
      font-size = 9;
      font-feature = "+calt, +liga, +dlig";
      bold-is-bright = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      gtk-titlebar = false;
      gtk-single-instance = true;
      window-decoration = false;
      scrollback-limit = 100000000; # ~100mb per terminal
      keybind = [
        # Remove default fullscreen bind
        "ctrl+enter=unbind"
      ];
    };
  };

}
