return {
    -- Add Haskell to Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "haskell")
        end,
    },

    -- Rust LSP config
    {
        "neovim/nvim-lspconfig",
        -- dependencies = {
        --     "MrcJkb/haskell-tools.nvim",
        --     branch = "1.x.x",
        --     init = function()
        --         require("lazyvim.util").on_attach(function(_, buffer)
        --             -- stylua: ignore
        --             vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        --             vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        --         end)
        --     end,
        -- },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                hls = {
                    -- cmd = {
                    --     "haskell-language-server-wrapper",
                    --     "--lsp",
                    -- },
                },
            },
            -- setup = {
            --     hls = function(_, opts)
            --         require("haskell-tools").setup({ server = opts })
            --         return true
            --     end,
            -- },
        },
    },
}
