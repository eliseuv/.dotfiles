{ ... }:
{

  programs.television = {
    enable = true;
    enableZshIntegration = true;
    channels = { };
    settings = {
      tick_rate = 50;
      ui = {
        use_nerd_font_icons = true;
        theme = "tokyonight";
      };
      keybindings = {
        quit = [
          "esc"
          "ctrl-c"
        ];
      };
    };
  };

}
