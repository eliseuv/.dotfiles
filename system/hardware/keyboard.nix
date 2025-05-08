{ pkgs, lib, ... }:
{

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
      "default" = {
        extraDefCfg = ''
          process-unmapped-keys yes
        '';
        config = ''
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
  };

  # Enable num lock early on boot
  systemd.services.numLockOnTty = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (
        pkgs.writeShellScript "numLockOnTty" ''
          for tty in /dev/tty{1..6}; do
              ${pkgs.kbd}/bin/setleds -D +num < "$tty";
          done
        ''
      );
    };
  };

}
