{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    ghc
    haskell-language-server
    cabal-install
    stack
  ];

}
