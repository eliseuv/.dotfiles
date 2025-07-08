{ ... }:
{

  imports = [

    # Automount
    ./udiskie.nix

    # Synchronize files
    ./syncthing.nix

    # pueue
    ./pueue.nix

    # Notify time every hour
    ./notify-clock.nix

  ];

}
