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
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            inlayHints = {
                                bindingModeHints = {
                                    enable = true,
                                },
                                chainingHints = {
                                    enable = true,
                                },
                                closureCaptureHints = {
                                    enable = true,
                                },
                                closureReturnTypeHints = {
                                    enable = "always",
                                },
                                discriminantHints = {
                                    enable = "fieldless",
                                },
                                expressionAdjustmentHints = {
                                    enable = "reborrow",
                                    hideOutsideUnsafe = false,
                                    mode = "prefer_prefix",
                                },
                                implicitDrops = {
                                    enable = true,
                                },
                                lifetimeElisionHints = {
                                    enable = "skip_trivial",
                                    useParameterNames = true,
                                },
                                parameterHints = {
                                    enable = true,
                                },
                                renderColons = true,
                                typeHints = {
                                    enable = true,
                                    hideClosureInitialization = false,
                                    hideNamedConstructor = false,
                                },
                            },
                            interpret = {
                                tests = true,
                            },
                        },
                    },
                },
            },
            inlay_hints = {
                enabled = true,
            },
        },
    },
    -- Just config lang syntax highlighting
    { "IndianBoy42/tree-sitter-just" },
}
