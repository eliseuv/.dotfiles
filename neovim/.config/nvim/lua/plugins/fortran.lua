return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "fortran")
        end,
    },
    {
        "neovim/nvim-lspconfig",
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
