local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                                                           ]],
	[[                                                           ]],
	[[                                                           ]],
	[[                                                           ]],
	[[                                          /$$              ]],
	[[                                         |__/              ]],
	[[ /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ]],
	[[| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$]],
	[[| $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
	[[| $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$]],
	[[| $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$]],
	[[|__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
	[[                                                           ]],
	[[                                                           ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "   find", ":Telescope find_files <CR>"),
	dashboard.button("e", "   new", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "   recent", ":Telescope oldfiles <CR>"),
	dashboard.button("q", "   quit", ":qa<CR>"),
}

local function footer()
	return ":(){ : | &: };:"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

vim.cmd([[autocmd User AlphaReady echo '     /Midnight']])

alpha.setup(dashboard.opts)
