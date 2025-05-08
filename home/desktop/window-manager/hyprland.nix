{ config, pkgs, ... }:
{

  imports = [ ../monitors.nix ];

  home.packages = with pkgs; [
    # Default terminal
    kitty
  ];

  monitors = [
    {
      width = 1920;
      height = 1080;
      refreshRate = 60;
    }
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # Monitors
      # monitor = " , 1920x1080@60, auto, 1";
      monitor = map (
        m:
        let
          resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          position = "${toString m.x}x${toString m.y}";
        in
        "${m.name},${if m.enable then "${resolution},${position},${toString m.scale}" else "disable"}"
      ) (config.monitors);

      # Variables
      "$terminal" = "ghostty";
      "$terminalCommand" = "ghostty -e ";
      "$menu" = "~/.config/rofi/bin/launcher";
      "$powermenu" = "~/.config/rofi/bin/powermenu";
      "$browser" = "firefox";
      "$fileManager" = "nautilus";

      # Autostart
      exec-once = [ ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,XCursor-Pro-Hyprcursor-Dark"
        "HYPRCURSOR_SIZE,24"
      ];

      # Keybinds
      "$mainMod" = "SUPER";
      bind = [
        # Exit
        "$mainMod SHIFT, backspace, exec, $powermenu"

        # Terminal
        "$mainMod, return, exec, $terminal"

        # Menu
        "$mainMod SHIFT, return, exec, $menu"

        # Programs
        "$mainMod SHIFT, B, exec, $browser"
        "$mainMod SHIFT, E, exec, emacsclient -nc -a 'emacs'"
        "$mainMod SHIFT, F, exec, $fileManager"

        # Commnads
        "$mainMod ALT, H, exec, $terminalCommand btm"
        "$mainMod ALT, M, exec, $terminalCommand pulsemixer"

        # Kill window
        "$mainMod SHIFT, Q, killactive,"

        # Select
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Move
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Layouts
        "$mainMod, space,fullscreen"
        "$mainMod, T, togglesplit, # dwindle"
        "$mainMod, S, pseudo, # dwindle"
        "$mainMod, V, togglefloating,"

        # Select workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspaces
        "$mainMod, P, togglespecialworkspace, magic"
        "$mainMod SHIFT, P, movetoworkspace, special:magic"

        # Scroll through existing workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows by dragging the mouse
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        # Sound control
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        # Brightness control
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        # Player control
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Look and feel
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 5;

        active_opacity = 1.0;
        inactive_opacity = 0.96;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];

      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        numlock_by_default = true;

        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      # Windows rules
      windowrulev2 = [
        # Smart gaps
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 5, floating:0, onworkspace:w[tv1]"
        "rounding 5, floating:0, onworkspace:f[1]"
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"
        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        # Default workspaces for programs
        # Editors
        "workspace 2, class:Emacs"
        "workspace 2, class:dev.zed.Zed"
        # Browsers
        "workspace 3, class:firefox"
        "workspace 3, class:Brave-browser"
        "workspace 3, class:Chromium-browser"
        # Media
        "workspace 4, class:Spotify"
        "workspace 4, class:mpv"
        # Documents
        "workspace 5, class:org.pwmt.zathura"
        # Chat
        "workspace 6, class:org.telegram.desktop"
        "workspace 6, class:discord"

      ];

      # Workspace rules
      workspace = [
        # Smart gaps
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

    };
  };

  # Catppuccin theme
  home.file.".config/hypr/catppuccin" = {
    source = ./hyprland/themes/catppuccin;
    recursive = true;
  };

}
