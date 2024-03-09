return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "rust")
        end,
    },

    -- Just config lang syntax highlighting
    { "IndianBoy42/tree-sitter-just" },
}
