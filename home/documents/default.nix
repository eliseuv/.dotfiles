{ pkgs, ... }: {

  imports = [

    # PDF viewer
    ./zathura.nix
    ./sioyek.nix

    # Ebooks
    ./calibre.nix

    # Papers
    ./zotero.nix

    # Typesetting
    ./latex.nix
    ./typst.nix
    ./markdown.nix

  ];

}
