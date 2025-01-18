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
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" "FiraCode" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # Terminal
    pkgs.ghostty

    # Utils
    pkgs.unzip
    pkgs.stow
    pkgs.fzf
    pkgs.bat
    pkgs.eza
    pkgs.yazi
    pkgs.fd
    pkgs.bottom

    # PDF reader
    pkgs.zathura

    # Image viewer
    pkgs.sxiv

    # Video player
    pkgs.mpv

    # Compilers
    pkgs.clang

    # Rust
    pkgs.rustup
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
  };


  programs = {

    neovim = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "evf";
      userEmail = "eliseuv816@gmail.com";
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        c = "clear";
        b = "bat";
        v = "nvim";

        l = "eza --group-directories-first --icons --color=always";
        la = "eza - -all - -group-directories-first - -icons - -color=always";
        ll = "eza --all --long --header --git --group-directories-first --icons --color=always";
        lt = "eza --all --tree --group-directories-first --icons --ignore-glob=.git --color=always";
        llt = "eza --all --long --header --tree --git --group-directories-first --icons --ignore-glob=.git --color=always";

        bt = "btm";

        rs = "rsync -Pazvhm";
        rsmv = "rsync -Pazvhm --remove-source-files";

        t = "tmux attach || tmux new-session";
        ta = "tmux attach -t";
        tn = "tmux new-session";
        tl = "tmux list-sessions";

        up = "nixos-rebuild switch --use-remote-sudo";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character.success_symbol = "[λ](bold green)";
      };
    };

    tmux = {
      enable = true;

      plugins = with pkgs; [
        tmuxPlugins.sensible
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.yank
        tmuxPlugins.catppuccin
      ];

      extraConfig = ''
        # Fix Neovim colors
        set-option -sa terminal-overrides ",xterm*:Tc"

        # set vi-mode
        set-window-option -g mode-keys vi
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
        set -g base-index 1
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

    # Menu
    rofi = {
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

    # Music player
    ncmpcpp = {
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
