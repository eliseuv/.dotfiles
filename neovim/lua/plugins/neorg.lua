return {
    -- -- LuaRocks
    -- {
    --     "vhyrro/luarocks.nvim",
    --     priority = 1000, -- We'd like this plugin to load first out of the rest
    --     config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    -- },

    -- neorg
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
}
