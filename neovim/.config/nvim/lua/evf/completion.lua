-- Completions

-- Safely initialize nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

-- Safely initialize luasnip
-- https://github.com/L3MON4D3/LuaSnip
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- Use existing vs-code style snippets form another plugin (e.g. rafamadriz/friendly-snippets)
-- https://github.com/rafamadriz/friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- Load custom snippets from path/to/nvim/config/snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

-- 
local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Nerd Fonts icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- nvim-cmp config
cmp.setup {

    -- Sources of completion
    -- this list also defines the order in which they appear
	sources = {
        -- https://github.com/hrsh7th/cmp-nvim-lsp
        { name = "nvim_lsp" },
        -- https://github.com/L3MON4D3/LuaSnip
		{ name = "luasnip" },
        -- https://github.com/hrsh7th/cmp-nvim-lua
		{ name = "nvim_lua" },
        -- https://github.com/kdheepak/cmp-latex-symbols
        { name = "latex_symbols" },
        -- https://github.com/hrsh7th/cmp-buffer
		{
            name = "buffer",
            option = {
                -- Use visible buffers
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end
            },
        },
        -- https://github.com/hrsh7th/cmp-path
		{
            name = "path",
            option = {
                -- Use trailing slash for dirs
                trailing_slash = true,
            }
        },
        -- https://github.com/hrsh7th/cmp-cmdline
        { name = "cmdline" },
	},

    -- Format completion menu
	formatting = {
        -- Fields: kind=symbol, abbr=name, menu=where does come from
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Use icons for kinds
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			--vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Menu names
			vim_item.menu = ({
                nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				nvim_lua = "[Neovim Lua]",
                latex_symbols = "[LaTeX]",
				buffer = "[Buffer]",
				path = "[Path]",
                cmdline = "[CMD Line]",
			})[entry.source.name]
			return vim_item
		end,
	},

    -- Specify snippet engine
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

    -- Keymaps
	mapping = {
        -- Move up/down on completion menu
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
        -- Scroll through completion menu
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        -- See all completions available
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- Exit completion menu
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm { select = true },
        -- Super tab
		["<Tab>"] = cmp.mapping(function(fallback)
            -- If on menu select -> next item
			if cmp.visible() then
				cmp.select_next_item()
            -- If snippet -> expand snippet
			elseif luasnip.expandable() then
				luasnip.expand()
            -- If snippet with multiple entries -> expand snippet or jump to next entry
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
            -- 
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
        -- Shift tab
		["<S-Tab>"] = cmp.mapping(function(fallback)
            -- If on menu select -> previous item
			if cmp.visible() then
				cmp.select_prev_item()
            -- If snippet with multiple entries -> jump to previous entry
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},

    -- 
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
    -- Info about the completion
    -- To disble itself:
    -- documentation = false,
    window = {
	    documentation = {
		    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	    },
    },
    -- Some experimental features
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
}
