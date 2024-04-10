return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "typst")
        end,
    },

    -- Typst LSP
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                typst_lsp = {
                    settings = {
                        exportPdf = "onType",
                    },
                },
            },
        },
    },

    -- Typst vim
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
    },
}
