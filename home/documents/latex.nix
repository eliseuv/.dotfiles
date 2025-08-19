{ pkgs, ... }:
{

  home.packages = with pkgs; [

    texliveFull

    texlab

  ];

  programs.tex-fmt = {
    enable = true;
    settings = { };
  };

}
