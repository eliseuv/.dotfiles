{ ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        vimAlias = true;

        theme = {
          enable = true;
          name = "tokyonight";
          style = "dark";
        };

        lsp = {
          enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          nix = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            format.enable = true;
            extraDiagnostics.enable = true;
          };

          rust = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            format.enable = true;
            crates.enable = true;
            dap.enable = true;
          };

          haskell = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            dap.enable = true;
          };

          ts = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            format.enable = true;
            extraDiagnostics.enable = true;
          };
        };
      };
    };
  };
}
