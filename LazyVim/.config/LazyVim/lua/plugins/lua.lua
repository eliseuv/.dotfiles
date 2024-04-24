return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "lua")
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            telemetry = {
                                enable = false,
                            },
                            hint = {
                                enable = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
