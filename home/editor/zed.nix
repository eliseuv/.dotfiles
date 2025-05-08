{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.zed-mono
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "zed-tokyo-night"
      "nix"
      "julia"
      "just"
    ];
    userSettings = {
      base_keymap = "VSCode";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      format_on_save = "on";
      # Buffer font
      buffer_font_family = "ZedMono Nerd Font";
      buffer_font_size = 12;
      # UI
      ui_font_size = 14;
      theme = {
        mode = "dark";
        light = "Andromeda";
        dark = "Catppuccin Mocha";
      };
      # Terminal
      terminal = {
        dock = "right";
        font_size = 12;
        font_family = "ZedMono Nerd Font";
      };
      # Vim
      vim_mode = true;
      vim = {
        use_multiline_find = true;
        use_smartcase_find = true;
        use_system_clipboard = "always";
      };
      # Inlay hints
      inlayHints = {
        maxLength = null;
        lifetimeElisionHints = {
          useParameterNames = true;
          enable = "skip_trivial";
        };
        closureReturnTypeHints = {
          "enable" = "always";
        };
      };
      # Languages
      languages = {
        Nix = {
          language_servers = [
            "!nil"
            "nixd"
          ];
          formatter.external = {
            command = "nixfmt";
          };
        };
      };
    };
  };

}
