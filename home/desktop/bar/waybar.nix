{ ... }:
{

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # Modules
  home.file.".config/waybar/modules.json".source = ./waybar/modules.json;

  # Styling
  home.file.".config/waybar/style.css".source = ./waybar/style.css;

}
