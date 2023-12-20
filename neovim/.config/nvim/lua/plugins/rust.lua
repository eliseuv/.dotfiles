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
                                closingBraceHints = {
                                    enable = true,
                                    minLines = 20,
                                },
                                closureCaptureHints = {
                                    enable = true,
                                },
                                closureReturnTypeHints = {
                                    enable = "always",
                                },
                                closureStyle = "impl_fn",
                                discriminantHints = {
                                    enable = "always",
                                },
                                expressionAdjustmentHints = {
                                    enable = "reborrow",
                                    hideOutsideUnsafe = false,
                                    mode = "prefix",
                                },
                                implicitDrops = {
                                    enable = true,
                                },
                                lifetimeElisionHints = {
                                    enable = "skip_trivial",
                                    useParameterNames = true,
                                },
                                maxLength = 25,
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
                            lens = {
                                forceCustomCommands = true,
                                implementations = {
                                    enable = true,
                                },
                                enable = true,
                                debug = {
                                    enable = true,
                                },
                                location = "above_name",
                                references = {
                                    enable = true,
                                    enumVariant = {
                                        enable = true,
                                    },
                                    method = {
                                        enable = true,
                                    },
                                    trait = {
                                        enable = true,
                                    },
                                    adt = {
                                        enable = true,
                                    },
                                },
                                run = {
                                    enable = true,
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
