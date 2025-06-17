{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Provides `notify-send`
    libnotify

  ];

  services.dunst = {
    enable = true;
  };

}
