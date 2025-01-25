{ ... }:
let
  nix-gc-env = builtins.fetchGit {
    url = "https://github.com/Julow/nix-gc-env";
    rev = "4753f3c95891b711e29cb6a256807d22e16cf9cd";
  };
in {

  imports = [ (import "${nix-gc-env}/nix_gc_env.nix") ];

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    delete_generations = "+8";
  };
}
