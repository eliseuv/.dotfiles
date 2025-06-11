{ pkgs, ... }:
{

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [

    # Weather info
    wttrbar

  ];

  # Modules
  home.file.".config/waybar/modules.json".source = ./waybar/modules.json;

  # Styling
  home.file.".config/waybar/style.css".source = ./waybar/style.css;

}
