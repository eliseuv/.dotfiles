{ ... }: {

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "caps:escape";
  };

  # Apply custom keyboard config
  services.kanata = {
    enable = true;
    keyboards = {
      "hyper".config = ''
        (defsrc
          caps
        )

        (deflayer base
          esc
        )
      '';
    };
  };
}
