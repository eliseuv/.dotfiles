{ pkgs, ... }: {

  home.packages = with pkgs; [

    # LSP
    nil
    nixd

    # Formatter
    nixfmt-classic

  ];

}
