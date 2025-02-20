{ pkgs, ... }: {

  imports = [

    # Tools
    ./tools/default.nix

    # Environments
    ./direnv.nix
    ./devenv.nix

    # Languages
    ./languages/nix.nix
    ./languages/rust.nix
    ./languages/julia.nix
    ./languages/haskell.nix
    ./languages/python.nix
    ./languages/lua.nix
    ./languages/go.nix
    ./languages/web.nix
  ];

}
