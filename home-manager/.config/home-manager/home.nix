{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "evf";
  home.homeDirectory = "/home/evf";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

    # Utils
    pkgs.unzip
    pkgs.stow

    # Programming
    pkgs.clang
    pkgs.rustup

    # Web browser
    pkgs.brave
    pkgs.chromium

    # Image viewer
    pkgs.sxiv

    # Telegram
    pkgs.telegram-desktop

    # Nerd Fonts
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" "FiraCode" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/evf/etc/profile.d/hm-session-vars.sh


  home = {
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      EDITOR = "nvim";

      # Rust
      RUST_BACKTRACE = 1;
      RUSTC_WRAPPER = "sccache";
      RUST_LOG = "debug";
    };
    shellAliases = {
      c = "clear";

      rs = "rsync -Pazvhm";
      rsmv = "rsync -Pazvhm --remove-source-files";

      stow = "stow --no-folding";

      up = "nixos-rebuild switch --use-remote-sudo";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "evf";
    userEmail = "eliseuv816@gmail.com";
  };
  home.shellAliases = {
    git-push = "git add .; git commit -m \"update\"; git push";
  };

  # Ghostty terminal
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight";
      font-family = "Iosevka Nerd Font";
      font-size = 10;
      bold-is-bright = true;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      title = "ghostty";
      class = "ghostty";
      # fullscreen = true;
      gtk-single-instance = true;
      adw-toolbar-style = "raised";
      # window-decoration = false;
      # gtk-titlebar = false;
    };
  };

  # ZSH shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character.success_symbol = "[λ](bold green)";
      directory = {
        truncation_length = 5;
        truncation_symbol = ".../";
        read_only = " 󰌾";
        substitutions = {
          "Documents" = "󰈙 ";
          "Projects" = "</>";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
    };
  };

  # Terminal multiplexer
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    newSession = true;
    # Fix Neovim colors
    # terminal = ",xterm*:Tc";
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.tmux-floax
      tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      # Fix Neovim colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open new windows and panes in cwd
      bind c new-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      set -g status-position top

      # Start windows and panes at 1, not 0
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_status_style "rounded"
    '';
  };
  home.shellAliases = {
    t = "tmux attach || tmux new-session";
    ta = "tmux attach -t";
    tn = "tmux new-session";
    tl = "tmux list-sessions";
  };

  # Another terminal multiplexer
  programs.zellij = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
    };
  };

  # Rusty find
  programs.fd = {
    enable = true;
  };

  # Rusty grep
  programs.ripgrep = {
    enable = true;

  };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files --no-ignore --hidden --follow --glob \"!.git/*\"";
    colors = {
      fg = "#f8f8f2";
      bg = "#282a36";
      hl = "#bd93f9";
      "fg+" = "#f8f8f2";
      "bg+" = "#44475a";
      "hl+" = "#bd93f9";
      info = "#ffb86c";
      prompt = "#50fa7b";
      pointer = "#ff79c6";
      marker = "#ff79c6";
      spinner = "#ffb86c";
      header = "#6272a4";
    };
    tmux.enableShellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
  };

  # System monitor
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        hide_avg_cpu = true;
        rate = 500;
        unnormalized_cpu = true;
        disable_click = true;
        process_memory_as_value = true;
      };
      process = {
        columns = [ "PID" "Name" "User" "State" "CPU%" "Mem%" "R/s" "W/s" "GPU%" "GMem%" "T.Read" "T.Write" ];
      };
      styles = {
        memory = {
          ram_color = "cyan";
          swap_color = "blue";
        };
        network = {
          rx_color = "light green";
          tx_color = "light red";
        };

        tables = {
          headers = {
            color = "blue";
            bold = true;
          };
        };

        graphs = {
          graph_color = "dark gray";
        };

        widgets = {
          border_color = "dark gray";
          selected_border_color = "magenta";
          selected_text = {
            color = "black";
            bg_color = "cyan";
          };
        };

      };

    };
  };
  home.shellAliases = {
    bt = "btm";
  };

  # NeoVim
  programs.neovim = {
    enable = true;
  };
  home.shellAliases = {
    v = "nvim";
  };

  # Zed
  programs.zed-editor = {
    enable = true;
    extensions = [ "catppuccin" "tokyo-night" "nix" "just" ];
    userSettings = {
      base_keymap = "VSCode";
      telemetry = { diagnostics = false; metrics = false; };
      format_on_save = "prettier";
      # Buffer font
      buffer_font_family = "Iosevka";
      buffer_font_size = 12;
      # UI
      ui_font_size = 14;
      theme = {
        mode = "dark";
        light = "Andromeda";
        dark = "Tokyo Night";
      };
      # Terminal
      terminal = {
        dock = "right";
        font_size = 12;
        font_family = "Iosevka";
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
    };
  };

  # Menu
  programs.rofi = {
    enable = true;
    font = "hack 12";
    extraConfig = {
      modi = "combi";
      combi-modi = "window,drun,ssh";
      kb-remove-char-forward = "Delete";
      kb-remove-char-back = "BackSpace,Shift+BackSpace";
      kb-remove-to-eol = "Control+d";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-mode-complete = "Control+l";
      kb-row-left = "Control+h";
      kb-row-up = "Up,Control+k,Control+p";
      kb-row-down = "Down,Control+j,Control+n";
    };
    terminal = "ghostty";
    theme = "tokyonight";
  };

  # Rusty cat
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
  };
  home.shellAliases = {
    b = "bat";
  };

  # Rusty ls
  programs.eza = {
    enable = true;
    git = true;
  };
  home.shellAliases = {
    l = "eza --group-directories-first --icons --color = always ";
    la = "
          eza - -all - -group-directories-first - -icons - -color=always";
    ll = "eza --all --long --header --git --group-directories-first --icons --color=always";
    lt = "eza --all --tree --group-directories-first --icons --ignore-glob=.git --color=always";
    llt = "eza --all --long --header --tree --git --group-directories-first --icons --ignore-glob=.git --color=always";
  };

  # Rusty TUI file manager
  programs.yazi = {
    enable = true;
  };
  home.shellAliases = {
    y = "yazi";
  };

  # Music player
  programs.ncmpcpp = {
    enable = true;
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }
      { key = "h"; command = "jump_to_parent_directory"; }
      { key = "l"; command = "enter_directory"; }
      { key = "J"; command = [ "select_item" "scroll_down" ]; }
      { key = "K"; command = [ "select_item" "scroll_up" ]; }
      { key = "ctrl-j"; command = "move_selected_items_up"; }
      { key = "ctrl-k"; command = "move_selected_items_down"; }
      # { key = "U"; command = "update_database"; }
    ];
  };

  # Firefox web browser
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.tridactyl-native
    ];
  };

  # PDF reader
  programs.zathura = {
    enable = true;
    mappings = { "<C-i>" = "recolor"; };
    extraConfig = ''
      set recolor true
    '';
  };

  # Video player
  programs.mpv = {
    enable = true;
    bindings = {
      "Alt+=" = "add video-zoom 0.1";
      "Alt+-" = "add video-zoom -0.1";
      "-" = "add volume -2";
      "=" = "add volume 2";
    };
    config = {
      hwdec = "auto";
      ytdl-raw-options = "force-ipv4=";
    };
    scripts = [ pkgs.mpvScripts.thumbfast pkgs.mpvScripts.mpv-playlistmanager ];
  };

  services = {

    # Music player daemon
    mpd = {
      enable = true;
      musicDirectory = "/run/media/evf/Storage/CompanionCube/music";
      playlistDirectory = "/run/media/evf/Storage/CompanionCube/music/playlists";

      extraConfig = ''
        audio_output {
            type    "pulse"
            name    "pulse"
        }

        audio_output {
            type    "fifo"
            name    "Visualizer feed"
            path    "/tmp/mpd.fifo"
            format  "44100:16:2"
        }
      '';

    };

  };

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "sxiv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

