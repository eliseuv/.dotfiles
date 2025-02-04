return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "html")
            table.insert(opts.ensure_installed, "css")
            table.insert(opts.ensure_installed, "scss")
            table.insert(opts.ensure_installed, "javascript")
            table.insert(opts.ensure_installed, "json")
            table.insert(opts.ensure_installed, "typescript")
            table.insert(opts.ensure_installed, "tsx")
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                ast_grep = {},
                biome = {},
                html = {},
                cssls = {},
                css_variables = {},
            },
        },
    },
}
