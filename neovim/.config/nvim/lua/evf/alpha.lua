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

-- dashboard.section.header.val = {
--     [[                               __                ]],
--     [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
--     [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--     [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--     [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--     [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

dashboard.section.header.val = {
	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

dashboard.section.buttons.val = {
    dashboard.button( "e",          "  New file" ,             ":ene <BAR> startinsert <CR>"),
	dashboard.button( "SPC f f",	"  Find file",	            ":Telescope find_files <CR>"),
	dashboard.button( "SPC f h",	"  Recently opened files", ":Telescope oldfiles <CR>"),
	--dashboard.button( "SPC f r",	"  Frecency/MRU",	        ":"),
	dashboard.button( "SPC f g",	"  Find word",	            ":Telescope live_grep <CR>"),
	dashboard.button( "SPC f m",	"  Jump to bookmarks",	    ":Telescope marks <CR>"),
	--dashboard.button( "SPC s l",	"  Open last session",	    ":"),
	dashboard.button( "SPC f c",	"  Select colorscheme",	":Telescope colorscheme <CR>"),
    dashboard.button( "q",          "  Quit" ,                 ":qa<CR>"),
}
local handle = io.popen('fortune')
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.config)

