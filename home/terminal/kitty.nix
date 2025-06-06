{ pkgs, ... }:
{

  programs.kitty = {

    enable = true;

    font = {
      # TODO: Enable all ligatures
      name = "IosevkaTerm Nerd Font";
      package = pkgs.nerd-fonts.iosevka-term;
      size = 9.5;
    };

    settings = {
      scrollback_lines = 10000;
      scrollback_pager_history_size = 64;
      hide_window_decorations = "yes";
    };

    keybindings = {
      "kitty_mod+u" = "scroll_page_up";
      "kitty_mod+d" = "scroll_page_down";
      "kitty_mod+p>d" = "kitten hints --program @ --type url";
      "kitty_mod+p>c" = "kitten hints --type path --program @";
      "kitty_mod+space" = "kitten unicode_input";
    };

    shellIntegration = {
      enableZshIntegration = true;
      mode = "enabled";
    };
    themeFile = "tokyo_night_night";

  };

}
