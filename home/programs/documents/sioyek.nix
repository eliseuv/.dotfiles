{ ... }: {

  programs.sioyek = {
    enable = true;
    config = {
      # Use dark mode by default
      "default_dark_mode" = "1";
    };
    bindings = {
      # Scroll screen
      "screen_up" = "<S-k>";
      "screen_down" = "<S-j>";
      # Scroll pages
      "previous_page" = "<C-p>";
      "next_page" = "<C-n>";
    };
  };

}
