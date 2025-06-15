{ pkgs, ... }:
{

  # Enable num lock early on boot
  boot.initrd.extraUtilsCommands = ''
    copy_bin_and_libs ${pkgs.kbd}/bin/setleds
  '';
  boot.initrd.preDeviceCommands = ''
    INITTY=/dev/tty[1-6]
    for tty in $INITTY; do
      /bin/setleds -D +num < $tty
    done
  '';

}
