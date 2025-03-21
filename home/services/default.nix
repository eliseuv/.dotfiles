{ ... }: {

  imports = [

    # Automount
    ./udiskie.nix

    # Synchronize files
    ./syncthing.nix

    # Systemd timers
    ./timers.nix

  ];

}
