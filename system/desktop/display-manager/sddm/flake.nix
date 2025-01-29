{ pkgs, ... }: {

  # # sddm theme
  # environment.systemPackages = [
  #   (pkgs.catppuccin-sddm.override {
  #     # flavor = "mocha";
  #     # font = "Noto Sans";
  #     # fontSize = "9";
  #     background = "${../../wallpapers/dunes.webp}";
  #     loginBackground = true;
  #   })
  # ];

  # Display Manager
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./theme.nix { inherit pkgs; }}";
    autoNumlock = true;
    settings = { general.numlock = true; };
  };

}
