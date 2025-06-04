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
        plugin = tmuxPlugins.tmux-thumbs;
        extraConfig = ''
          set -g @thumbs-command 'echo -n {} | xclip -selection clipboard'
        '';
      }
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
      # Fix Neovim colors
      set -sg terminal-overrides ",*:RGB"

      # Cleaner panes separator
      set -g pane-border-lines simple

      # Open new windows and panes in cwd
      bind c new-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"

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
