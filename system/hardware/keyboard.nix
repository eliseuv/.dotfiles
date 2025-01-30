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
        (defcfg
            process-unmapped-keys = yes
        )

        (defsrc
            grv
            caps    h   j   k   l
        )

        (deflayer default
            @grv
             esc    _   _   _   _
        )

        (deflayer arrows
            _
            _     left down up rght
        )

        (defalias
            grv (tap-hold-press 200 200 grv (layer-toggle arrows))
        )
      '';
    };
  };

}
