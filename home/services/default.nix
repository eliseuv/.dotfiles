{ ... }: {

  imports = [

    # Automount
    ./udiskie.nix

    # Synchronize files
    ./syncthing.nix

  ];

}
