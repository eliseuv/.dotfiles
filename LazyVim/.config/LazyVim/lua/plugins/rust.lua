return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "rust")
        end,
    },

    -- Just grammar
    { "IndianBoy42/tree-sitter-just" },
}
