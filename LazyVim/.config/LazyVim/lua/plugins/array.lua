return {
    -- -- Tree-sitter
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     opts = function(_, opts)
    --         table.insert(opts.ensure_installed, "uiua")
    --     end,
    -- },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                uiua = {},
            },
        },
    },
}