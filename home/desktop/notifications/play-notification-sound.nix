{ pkgs }:
pkgs.writeShellScriptBin "play-notification-sound" ''
  pw-play ~/.local/share/sounds/notification.ogg
''
