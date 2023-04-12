return {
    -- add rust to treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "fortran")
        end,
    },

    -- correctly setup lspconfig for Rust 🚀
    {
        "neovim/nvim-lspconfig",
        dependencies = { "simrat39/rust-tools.nvim" },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                fortls = {
                    cmd = {
                        "fortls",
                        "--notify_init",
                        "--sort_keywords",
                        "--lowercase_intrinsics",
                        "--use_signature_help",
                        "--hover_signature",
                        "--hover_language=fortran95",
                        "--enable_code_actions",
                    },
                },
            },
        },
    },
}
