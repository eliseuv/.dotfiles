return {
    -- YAML
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "yaml")
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "yamlls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                yamlls = {},
            },
        },
    },

    -- Tridactyl config file syntax
    { "tridactyl/vim-tridactyl" },

    -- -- kdl: cuddly document language
    -- { "imsnif/kdl.vim" },

    -- Kitty config file
    { "fladson/vim-kitty" },
}
