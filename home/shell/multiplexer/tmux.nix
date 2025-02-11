{ pkgs, ... }: {

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    newSession = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.tmux-floax
      tmuxPlugins.tmux-thumbs
      tmuxPlugins.tokyo-night-tmux
      # tmuxPlugins.catppuccin
    ];
    sensibleOnTop = true;
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

      # Status bar
      set -g status-position top

      # Floax
      set -g @floax-bind 'C-b'
      set -g @floax-width '90%'
      set -g @floax-height '90%'

      # Tokyo night
      set -g @tokyo-night-tmux_theme night    # storm | day | default to 'night'
      set -g @tokyo-night-tmux_transparent 1  # 1 or 0
      set -g @tokyo-night-tmux_show_datetime 0
      set -g @tokyo-night-tmux_date_format YMD
      set -g @tokyo-night-tmux_time_format 24H
      set -g @tokyo-night-tmux_show_battery_widget 1
    '';
  };

  home.shellAliases = {
    t = "tmux attach || tmux new-session";
    ta = "tmux attach -t";
    tn = "tmux new-session";
    tl = "tmux list-sessions";
  };
}
