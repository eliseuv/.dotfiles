return {
    -- Add Rust to Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "rust")
        end,
    },

    -- Rust LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = { "simrat39/rust-tools.nvim" },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                rust_analyzer = {
                    cmd = {
                        "rustup",
                        "run",
                        "stable",
                        "rust-analyzer",
                    },
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = true,
                            procMacro = {
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                rust_analyzer = function(_, opts)
                    require("lazyvim.util").on_attach(function(client, buffer)
                        if client.name == "rust_analyzer" then
                            vim.keymap.set(
                                "n",
                                "<leader>ch",
                                "<cmd>RustHoverActions<cr>",
                                { buffer = buffer, desc = "Hover Actions (Rust)" }
                            )
                            vim.keymap.set(
                                "n",
                                "<leader>cR",
                                "<cmd>RustCodeActionGroup<cr>",
                                { buffer = buffer, desc = "Code Action (Rust)" }
                            )
                            vim.keymap.set(
                                "n",
                                "<leader>ce",
                                "<cmd>RustExpandMacro<cr>",
                                { buffer = buffer, desc = "Expand Macro (Rust)" }
                            )
                        end
                    end)
                    local rust_opts = {
                        server = vim.tbl_deep_extend("force", {}, opts, opts.server or {}),
                        tools = { -- rust-tools options
                            -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                            hover_actions = {
                                -- whether the hover action window gets automatically focused
                                auto_focus = true,
                            },
                        },
                    }
                    require("rust-tools").setup(rust_opts)
                    return true
                end,
            },
        },
    },
}
