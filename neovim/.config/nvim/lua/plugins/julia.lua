return {
    -- Add Julia to Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "julia")
        end,
    },

    -- Rust LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "JuliaEditorSupport/julia-vim" },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                julials = {
                    on_new_config = function(new_config, _)
                        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
                        if require("lspconfig").util.path.is_file(julia) then
                            new_config.cmd[1] = julia
                        end
                    end,
                },
            },
        },
    },
}