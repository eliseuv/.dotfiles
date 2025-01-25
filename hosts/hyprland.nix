{ pkgs, ... }: {

  # sddm theme
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      # flavor = "mocha";
      # font = "Noto Sans";
      # fontSize = "9";
      # background = "${./wallpaper.png}";
      loginBackground = true;
    })
  ];

  # Display Manager
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "catppuccin-mocha";
    wayland.enable = true;
    autoNumlock = true;
    settings = { general.numlock = true; };
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

}
