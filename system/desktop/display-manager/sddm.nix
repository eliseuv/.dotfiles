{ pkgs, ... }:
{

  # sddm theme
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      # flavor = "mocha";
      # font = "Noto Sans";
      # fontSize = "9";
      loginBackground = true;
      background = "${../../../resources/wallpapers/glowing-triangle-neon.jpg}";
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
  };

}
