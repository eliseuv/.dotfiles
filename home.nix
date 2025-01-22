{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./tmux.nix
    ./ghostty.nix
    ./xmonad.nix
    ./rust.nix
    ./neovim.nix
    ./emacs.nix
    ./ncmpcpp.nix
    ./fastfetch.nix
    ./firefox.nix
    ./zed.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Disks
    cryptsetup
    udiskie
    # GNU stow
    stow
    # Rusty sed
    sd
    # Disk usage analyzer
    dua
    # Build tool
    just
    # Benchmarking
    hyperfine
    # File manager
    nautilus
    # Web browsers
    brave
    chromium
    # Image viewer
    sxiv
    # Telegram
    telegram-desktop
    # Music
    spotify

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  fonts.fontconfig.enable = true;

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
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = { };
    shellAliases = {
      c = "clear";
      rs = "rsync -Pazvhm";
      rsmv = "rsync -Pazvhm --remove-source-files";
      stow = "stow --no-folding";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "evf";
    userEmail = "eliseuv816@gmail.com";
    delta.enable = true;
  };
  home.shellAliases = {
    git-push = ''git add .; git commit -m "update"; git push'';
  };

  # Rusty cat
  programs.bat = {
    enable = true;
    config = { theme = "TwoDark"; };
  };
  home.shellAliases = { b = "bat"; };

  # Rusty ls
  programs.eza = {
    enable = true;
    colors = "auto";
    git = true;
    icons = "auto";
    extraOptions = [ "--group-directories-first" ];
  };
  home.shellAliases = {
    l = "eza";
    la = "eza --all";
    ll = "eza --all --long --header";
    lt = "eza --all --tree --ignore-glob=.git";
    llt = "eza --all --long --header --tree --ignore-glob=.git";
  };

  # Rusty find
  programs.fd = { enable = true; };

  # Rusty grep
  programs.ripgrep = { enable = true; };

  # Rusty TUI file manager
  programs.yazi.enable = true;
  home.shellAliases.y = "yazi";

  # Rusty TUI file manager
  programs.broot = {
    enable = true;
    settings = { modal = true; };
  };

  # Rusty System monitor
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
        columns = [
          "PID"
          "Name"
          "User"
          "State"
          "CPU%"
          "Mem%"
          "R/s"
          "W/s"
          "GPU%"
          "GMem%"
          "T.Read"
          "T.Write"
        ];
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

        graphs = { graph_color = "dark gray"; };

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
  home.shellAliases = { bt = "btm"; };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    defaultCommand =
      ''rg --files --no-ignore --hidden --follow --glob "!.git/*"'';
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

  # Another terminal multiplexer
  programs.zellij = {
    enable = true;
    settings = { theme = "Catppuccin Mocha"; };
  };

  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        mouse = false;
        line-number = "relative";
        idle-timeout = 100;
        completion-timeout = 100;
        completion-replace = true;
        true-color = true;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
      };
      editor.cursor-shape = { insert = "bar"; };
      editor.file-picker = { hidden = false; };
      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };
      editor.inline-diagnostics = {
        cursor-line = "hint";
        other-lines = "warning";
      };
    };
  };

  # PDF reader
  programs.zathura = {
    enable = true;
    mappings = { "<C-i>" = "recolor"; };
    extraConfig = ''
      set recolor true
    '';
  };

  # Image viewer
  programs.feh = { enable = true; };

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

  # Gnupg
  programs.gpg = {
    enable = true;
    settings = { };
  };
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 3600;
    defaultCacheTtlSsh = 3600;
    maxCacheTtlSsh = 3600;
    pinentryPackage = pkgs.pinentry-gtk2;
  };

  services = {

    # Automount volumes
    udiskie = {
      enable = true;
      automount = true;
      tray = "never";
    };

    # Hide mouse
    unclutter.enable = true;

    # File syncronization
    syncthing = { enable = true; };

  };

  # Mime apps
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "zathura.desktop" ];
    "image/*" = [ "sxiv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
}
