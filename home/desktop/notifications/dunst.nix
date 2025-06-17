{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Provides `notify-send`
    libnotify

    # Font
    nerd-fonts.ubuntu

    # Notification sound script
    (import ./notification-sound.nix { inherit pkgs; })

  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-center";
        offset = "(0, 5)";
        follow = "keyboard";
        font = "Ubuntu Nerd Font 9";
        width = "(0, 300)";
        frame_width = 2;
        corner_radius = 5;
      };
      urgency_normal = {
        background = "#1e1d2f";
        foreground = "#bd93f9";
        frame_color = "#5e497c";
        timeout = 10;
      };
      play_sound = {
        summary = "*";
        script = "notification-sound.sh";
      };
    };
  };

  # Notification sound
  home.file.".config/dunst/notification.ogg".source = ../../../resources/sounds/notification.ogg;

}
