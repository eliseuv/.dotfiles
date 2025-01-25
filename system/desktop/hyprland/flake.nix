{ ... }: {

  imports = [ ../sddm/flake.nix ];

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

}
