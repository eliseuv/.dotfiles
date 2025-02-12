{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    newSession = true;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.tmux-floax;
        extraConfig = ''
          set -g @floax-bind 'C-b'
          set -g @floax-width '90%'
          set -g @floax-height '90%'
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g status-position top
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -agF status-right "#{E:@catppuccin_status_cpu}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
          set -agF status-right "#{E:@catppuccin_status_battery}"
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
      tmuxPlugins.cpu
      tmuxPlugins.battery
    ];
    extraConfig = ''
      # Fix Neovim colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Open new windows and panes in cwd
      bind c new-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

      # Ctrl-Shift vim keys to switch windows
      bind -n C-S-h previous-window
      bind -n C-S-l next-window
    '';
  };

  home.shellAliases = {
    t = "tmux attach || tmux new-session";
    ta = "tmux attach -t";
    tn = "tmux new-session";
    tl = "tmux list-sessions";
  };
}
