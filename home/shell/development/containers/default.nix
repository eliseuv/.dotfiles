{ pkgs, ... }: {

  imports = [

    # Development environments
    ./devenv.nix
    ./direnv.nix

    # Containers
    ./podman.nix

  ];

  environment.systemPackages = with pkgs; [ distrobox distrobox-tui ];

}
