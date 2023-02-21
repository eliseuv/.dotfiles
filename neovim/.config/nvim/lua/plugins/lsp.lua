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
                        "nightly",
                        "rust-analyzer",
                    },
                },
            },
        },
    },
}
