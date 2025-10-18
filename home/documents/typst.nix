{ pkgs, pkgs-unstable, ... }:
{

  home.packages =
    with pkgs;
    [

      typst

      # LSP
      tinymist

      # Formatter
      typstyle
      prettypst

      # Packager manager
      utpm

    ]
    # Latest versions
    ++ (with pkgs-unstable; [

      # Font Awesome for icons in documents
      font-awesome

    ]);

}
