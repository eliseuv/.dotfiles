return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "dockerfile")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {},
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                dockerls = {},
            },
        },
    },
}
