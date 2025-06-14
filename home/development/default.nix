{ ... }:
{

  imports = [

    # Git
    ./git/default.nix

    # Tools
    ./tools/default.nix

    # Languages
    ./languages/nix.nix
    ./languages/c.nix
    ./languages/rust.nix
    ./languages/julia.nix
    ./languages/haskell.nix
    ./languages/web.nix

    # Development environments
    ./environment/default.nix

  ];

  # Nix Shell
  home.shellAliases = {
    ns = "nix-shell --command zsh --packages";
  };

}
