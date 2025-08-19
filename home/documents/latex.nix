{ pkgs, ... }:
{

  home.packages = with pkgs; [

    texliveFull

  ];

  programs.tex-fmt = {
    enable = true;
    settings = { };
  };

}
