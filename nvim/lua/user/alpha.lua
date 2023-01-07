local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")



dashboard.section.header.val = {
	[[                                     ]],
	[[                                     ]],
	[[                                     ]],
	[[   ██ ███   ███ ▀▀▀                ██]],
	[[  ██  ███   ███ ███ ███████████   ██ ]],
	[[ ██    ███  ███ ███ ███ ███ ███  ██  ]],
	[[██      ██████   ██ ███  ██  ██ ██   ]],
	[[                                     ]],
	[[                                     ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "[] search", ":Telescope find_files <CR>"),
	dashboard.button("r", "[﬚] recent", ":Telescope oldfiles <CR>"),
	dashboard.button("e", "[] create", ":ene <BAR> startinsert <CR>"),
	dashboard.button("q", "[] leave", ":qa<CR>"),
}

local function footer()
	return "#include <midnight>"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

vim.cmd([[autocmd User AlphaReady echo '     /Midnight']])

alpha.setup(dashboard.opts)
