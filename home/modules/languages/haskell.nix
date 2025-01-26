{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # The glorious Glasgow Haskell Compiler
    ghc
    # LSP
    haskell-language-server
    # Projects
    cabal-install
    cabal2nix
    stack
    # Prettifier
    stylish-haskell
  ];

}
