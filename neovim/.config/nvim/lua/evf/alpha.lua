-- Alpha init screen
-- https://github.com/goolord/alpha-nvim

-- Safely initialize alpha
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

-- Select theme: dashboard or startify
local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok then
	return
end

-- Header
dashboard.section.header.val = {
	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	--     [[                               __                ]],
	--     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	--     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	--     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	--     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	--     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

-- Buttons
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("h", "  Recently opened files", ":Telescope oldfiles <CR>"),
	dashboard.button("r", "  Frecency/MRU", ":Telescope frecency <CR>"),
	dashboard.button("g", "  Find string", ":Telescope live_grep <CR>"),
	dashboard.button("m", "  Jump to bookmarks", ":Telescope marks <CR>"),
	dashboard.button("l", "  Open last session", ":SessionManager load_last_session <CR>"),
	dashboard.button("c", "  Select colorscheme", ":Telescope colorscheme <CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer
local function footer()
	local handle = io.popen("echo $(whoami)@$(hostname)")
    str = handle:read("*a")
	handle:close()
    return str
end
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.config.opts.noautocmd = true

--vim.cmd([[autocmd User AlphaReady echo 'ready']])

alpha.setup(dashboard.config)
