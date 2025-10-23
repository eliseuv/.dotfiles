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

  home.file.".latexmkrc".text = ''
    $pdf_previewer = 'start zathura';
  '';

}
