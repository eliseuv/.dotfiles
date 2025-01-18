return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "typst")
        end,
    },

    -- tinymist
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "tinymist",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                tinymist = {
                    --- todo: these configuration from lspconfig maybe broken
                    single_file_support = true,
                    root_dir = function()
                        return vim.fn.getcwd()
                    end,
                    --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
                    settings = {
                        outputPath = "$root/target/$dir/$name",
                        exportPdf = "onDocumentHasTitle",
                        formatterMode = "typstyle",
                    },
                },
            },
        },
    },

    -- Typst preview
    {
        "chomosuke/typst-preview.nvim",
        lazy = false,
        version = "1.*",
        ft = "typst",
        follow_cursor = true,
        invert_colors = "always",
        open_cmd = "firefox %s -P typst-preview --class typst-preview",
        build = function()
            require("typst-preview").update()
        end,
    },

    -- -- Typst LSP
    -- {
    --     "neovim/nvim-lspconfig",
    --     ---@class PluginLspOpts
    --     opts = {
    --         ---@type lspconfig.options
    --         servers = {
    --             typst_lsp = {
    --                 settings = {
    --                     exportPdf = "onType",
    --                 },
    --             },
    --         },
    --     },
    -- },

    -- -- Typst vim
    -- {
    --     "kaarmu/typst.vim",
    --     ft = "typst",
    --     lazy = false,
    -- },
}
