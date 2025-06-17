{ ... }:
{

  imports = [

    # Automount
    ./udiskie.nix

    # Synchronize files
    ./syncthing.nix

    # Notify time every hour
    ./notify-clock.nix

  ];

}
