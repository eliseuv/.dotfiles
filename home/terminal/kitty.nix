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
      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
    };

    keybindings = {
      "kitty_mod+u" = "scroll_page_up";
      "kitty_mod+d" = "scroll_page_down";
      "kitty_mod+p>d" = "kitten hints --program @ --type url";
      "kitty_mod+p>c" = "kitten hints --type path --program @";
      "kitty_mod+space" = "kitten unicode_input";

      # Browse scrollback buffer in nvim
      "kitty_mod+h" = "kitty_scrollback_nvim";
      # Browse output of the last shell command in nvim
      "kitty_mod+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";
      # Show clicked command output in nvim
      # mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output
    };

    actionAliases = {
      # kitty-scrollback.nvim Kitten alias
      "kitty_scrollback_nvim" =
        "kitten /home/evf/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py";

    };

    shellIntegration = {
      enableZshIntegration = true;
      mode = "enabled";
    };
    themeFile = "tokyo_night_night";

  };

}
