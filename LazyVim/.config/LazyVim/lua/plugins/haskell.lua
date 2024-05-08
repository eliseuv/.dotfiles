return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "haskell")
        end,
    },

    -- Language server
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                hls = {},
            },
        },
    },
}
