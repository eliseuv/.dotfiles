{ ... }: {

  imports = [

    # Git
    ./git/default.nix

    # Tools
    ./tools/default.nix

    # Languages
    ./languages/nix.nix
    ./languages/rust.nix
    ./languages/julia.nix
    ./languages/haskell.nix
    ./languages/python.nix
    ./languages/lua.nix
    ./languages/go.nix
    ./languages/ocaml.nix
    ./languages/lean.nix
    ./languages/zig.nix
    ./languages/web.nix

    # Development environments
    ./environment/default.nix

  ];

  # Nix Shell
  home.shellAliases = { ns = "nix-shell --command zsh --packages"; };

}
