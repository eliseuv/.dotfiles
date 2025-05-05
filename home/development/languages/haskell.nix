{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # The glorious Glasgow Haskell Compiler
    ghc

    # LSP
    haskell-language-server

    # Linter
    hlint

    # Projects
    cabal-install
    cabal2nix
    stack

    # Hoogle
    haskellPackages.hoogle

    # Tags generation
    haskellPackages.fast-tags

    # Debug
    haskellPackages.haskell-debug-adapter
    haskellPackages.ghci-dap

    # Prettifier
    stylish-haskell

  ];

}
