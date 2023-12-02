return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "rust")
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                rust_analyzer = {},
            },
            inlay_hints = {
                enabled = true,
            },
        },
    },
    -- Just config lang syntax highlighting
    { "IndianBoy42/tree-sitter-just" },
}
