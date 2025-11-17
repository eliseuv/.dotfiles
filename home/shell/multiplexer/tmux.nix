{ pkgs, ... }:
{

  programs.tmux = {
    enable = true;
    prefix = "`";
    keyMode = "vi";
    terminal = "tmux-256color";
    escapeTime = 0;
    focusEvents = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    newSession = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.fingers;
        extraConfig = ''
          # Match URLs
          bind U run -b "#{@fingers-cli} start #{pane_id} --patterns url"
          # Match SHA256 hashes
          set -g @fingers-pattern-sha256 "sha256-[a-zA-Z0-9+/]{43}="
          bind H run -b "#{@fingers-cli} start #{pane_id} --patterns sha256"
          # Edit file using nvim in a new tmux window
          bind E run -b "#{@fingers-cli} start #{pane_id} --patterns path --main-action 'xargs tmux new-window nvim'"
          # Target adjacent panes
          bind -n M-h run -b "#{@fingers-cli} start {left-of}"
          bind -n M-j run -b "#{@fingers-cli} start {down-of}"
          bind -n M-k run -b "#{@fingers-cli} start {up-of}"
          bind -n M-l run -b "#{@fingers-cli} start {right-of}"
          bind -n M-o run -b "#{@fingers-cli} start {last}"
        '';
      }
      {
        plugin = tmuxPlugins.tmux-floax;
        extraConfig = ''
          set -g @floax-bind 'k'
          set -g @floax-width '90%'
          set -g @floax-height '90%'
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"

          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
        '';
      }
    ];
    extraConfig = ''
      # Clipboard integration
      set -s set-clipboard external

      # Fix Neovim colors
      set -sg terminal-overrides ",*:RGB"

      # Cleaner panes separator
      set -g pane-border-lines simple

      # Increase repeat time to send multple commands a time
      set -sg repeat-time 1000

      # Last window
      bind h last-window

      # Open new windows and panes in cwd
      bind c new-window -c "#{pane_current_path}"
      bind l split-window -h -c "#{pane_current_path}"
      bind j split-window -v -c "#{pane_current_path}"

      # Ctrl-Shift vim keys to switch windows
      bind -n C-S-h previous-window
      bind -n C-S-l next-window

      # Status bar on top
      set -g status-position top

      # Send prefix to nested session
      bind-key -n C-a send-prefix
    '';

    tmuxinator.enable = true;
  };

  home.shellAliases = {
    t = "tmux attach || tmux new-session";
    ta = "tmux attach -t";
    tn = "tmux new-session";
    tl = "tmux list-sessions";
  };

  # Session mamanger
  programs.smug = {
    enable = true;
  };

}
