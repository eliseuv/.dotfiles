{ pkgs, ... }: {

  imports = [

    # Tools
    ./tools.nix

    # Environments
    ./direnv.nix
    ./devenv.nix

    # Languages
    ./languages/nix.nix
    ./languages/rust.nix
    ./languages/julia.nix
    ./languages/haskell.nix
    ./languages/python.nix
    ./languages/go.nix
    ./languages/web.nix
  ];

}
