{ ... }: {

  programs.sioyek = {
    enable = true;
    config = {
      # Use dark mode by default
      "default_dark_mode" = "1";
    };
    bindings = {
      # Scroll screen
      "screen_up" = "<C-p>";
      "screen_down" = "<C-n>";
      # Scroll pages
      "previous_page" = "<C-u>";
      "next_page" = "<C-d>";
    };
  };

}
