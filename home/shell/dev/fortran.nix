{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Compiler
    gfortran

    # LSP
    fortls

  ];

}
