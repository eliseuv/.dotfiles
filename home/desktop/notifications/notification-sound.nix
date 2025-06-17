{ pkgs }:
pkgs.writeShellScriptBin "notification-sound.sh" ''
  pw-play ~/.config/dunst/notification.ogg
''
