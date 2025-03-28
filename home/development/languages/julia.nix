{ pkgs, ... }: {

  home.packages = with pkgs; [ julia-bin ];

  home.file = {
    # REPL startup script
    ".julia/config/startup.jl".source = ./julia/startup.jl;
    # LSP requirements makefile
    ".julia/environments/nvim-lspconfig/Makefile".source = ./julia/Makefile;
    # Pluto notebook templates
    ".julia/pluto_notebooks/ingredients.jl".source = ./julia/ingredients.jl;
  };

  home.sessionVariables = { JULIA_NUM_THREADS = "auto"; };

  home.shellAliases = {
    julia-env-update = "julia --eval 'using Pkg; Pkg.update()'";
    julia-env-gc = "julia --eval 'using Pkg; Pkg.gc()'";
    pluto-run = "julia --eval 'using Pluto; Pluto.run(launch_browser=false)'";
  };

}
