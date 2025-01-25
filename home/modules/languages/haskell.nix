{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # The glorious Glasgow Haskell Compiler
    ghc
    # LSP
    haskell-language-server
    # Projects
    cabal-install
    stack
  ];

}
