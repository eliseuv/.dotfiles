{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # sed
    sd
    # Disk usage analyzer
    dua
  ];

  # cd
  programs.zoxide = { enable = true; };

  # cat
  programs.bat = {
    enable = true;
    config = { theme = "TwoDark"; };
  };
  home.shellAliases = { b = "bat"; };

  # ls
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

  # find
  programs.fd = { enable = true; };

  # grep
  programs.ripgrep = { enable = true; };

  # TUI file manager
  programs.yazi.enable = true;
  home.shellAliases.y = "yazi";

  # TUI file manager
  programs.broot = {
    enable = true;
    settings = { modal = true; };
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
