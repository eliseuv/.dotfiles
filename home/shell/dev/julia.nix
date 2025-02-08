{ pkgs, ... }: {

  home.packages = with pkgs; [ julia ];

  home.file = {
    # REPL startup script
    ".julia/config/startup.jl".source = ./julia/startup.jl;
    # LSP requirements makefile
    ".julia/environments/nvim-lspconfig/Makefile".source = ./julia/Makefile;
    # Pluto notebook templates
    ".julia/pluto_notebooks/ingredients.jl".source = ./julia/ingredients.jl;
  };

}
