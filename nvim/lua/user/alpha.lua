local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- menu title
dashboard.section.header.val =
{
	[[                                     ]],
	[[                                     ]],
	[[   ██ ███   ███ ▀▀▀                ██]],
	[[  ██  ███   ███ ███ ███████████   ██ ]],
	[[ ██    ███  ███ ███ ███ ███ ███  ██  ]],
	[[██      ██████   ██ ███  ██  ██ ██   ]],
	[[                                     ]],
	[[                                     ]],
}

-- menu navigation buttons
dashboard.section.buttons.val =
{
	dashboard.button("1", "[] search", ":Telescope find_files theme=dropdown<CR>"),
	dashboard.button("2", "[﬚] recent", ":Telescope oldfiles theme=dropdown<CR>"),
	dashboard.button("3", "[] create", ":ene <BAR> startinsert <CR>"),
	dashboard.button("4", "[] leave", ":qa<CR>"),
}

-- menu footer 
dashboard.section.footer.val = "#include <midnight>"

-- menu colors
dashboard.section.header.opts.hl =  "Float"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl =  "Keyword"

-- setup
alpha.setup(dashboard.opts)
