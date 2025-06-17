{ pkgs }:
pkgs.writeShellScriptBin "notification-sound.sh" ''
  pw-play ~/.local/share/sounds/notification.ogg
''
