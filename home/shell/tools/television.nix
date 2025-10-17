{ ... }:
{

  programs.television = {
    enable = true;
    enableZshIntegration = true;
    channels = { };
    settings = {
      shell_integration = {
        channel_triggers = {
          dirs = [
            "cd"
            "ls"
            "l"
            "ll"
          ];
          files = [
            "cat"
            "bat"
            "b"
          ];
        };
      };
      tick_rate = 50;
      ui = {
        use_nerd_font_icons = true;
        theme = "tokyonight";
        input_bar_position = "bottom";
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
