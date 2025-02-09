{ pkgs, ... }: {

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

      # # Add mouse support
      # set -g mouse on

      # # Change prefix
      # unbind C-b
      # set -g prefix C-Space
      # bind C-Space send-prefix

      # # Vim style pane selection
      # bind h select-pane -L
      # bind j select-pane -D 
      # bind k select-pane -U
      # bind l select-pane -R

      set -g status-position top

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # # Shift arrow to switch windows
      # bind -n S-Left  previous-window
      # bind -n S-Right next-window

      # # Prefix + h/l to switch windows
      # bind h previous-window
      # bind l next-window

      # The default width and height of the floating pane
      set -g @floax-width '90%'
      set -g @floax-height '90%'

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
}
