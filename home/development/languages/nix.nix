{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # LSP
    nil
    nixd

    # Formatter
    nixfmt-rfc-style
    nixpkgs-fmt

  ];

}
