return {
    -- Haskell tools
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^4", -- Recommended
        lazy = false, -- This plugin is already lazy
        keys = {
            { "<leader>hs", require("haskell-tools").hoogle.hoogle_signature, desc = "Hoogle search" },
            { "<leader>ea", require("haskell-tools").lsp.buf_eval_all, desc = "Evaluate all code snippets" },
            { "<leader>rr", require("haskell-tools").repl.toggle, desc = "Toggle GHCi repl" },
            {
                "<leader>rb",
                function()
                    require("haskell-tools").repl.toggle(vim.api.nvim_buf_get_name(0))
                end,
                desc = "Toggle GHCi repl for buffer",
            },
            { "<leader>rq", require("haskell-tools").repl.quit, desc = "Close GHCi repl" },
        },
    },
}
