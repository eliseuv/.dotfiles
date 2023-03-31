return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "JuliaEditorSupport/julia-vim",
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                julials = {},
                pyright = {},
                rust_analyzer = {
                    cmd = {
                        "rustup",
                        "run",
                        "stable",
                        "rust-analyzer",
                    },
                },
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
