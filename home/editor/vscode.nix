{ pkgs, ... }:
{

  programs.vscode = {

    enable = true;

    haskell = {
      enable = true;
      hie.enable = true;
    };

  };

}
