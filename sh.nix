{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # GNU stow
    stow
    # Rusty sed
    sd
    # Disk usage analyzer
    dua
  ];

  # Shell scripts
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.file = {
    ".local/bin" = {
      source = ./scripts;
      recursive = true;
    };
  };

  # Aliases
  home.shellAliases = {
    c = "clear";
    rs = "rsync -Pazvhm";
    rsmv = "rsync -Pazvhm --remove-source-files";
    stow = "stow --no-folding";
  };

  # ZSH
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

      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  programs.zoxide = { enable = true; };

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

  # GitHub cli
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      pager = "bat";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };

}
