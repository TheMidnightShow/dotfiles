-- nvim configs by midnight

-- packer and fast plugin load
require('user.plugins')
require('impatient')

-- basic configuration
require('user.keybinds')
require('user.settings')

-- completion and diagnostic
require('user.cmp')
require('user.lsp')

-- identation and navigation
require('user.alpha')
require('user.nvimtree')
require('user.autopairs')
require('user.bufferline')
require('user.indentline')
require('user.toggleterm')

-- colors
require('colorizer').setup()

-- status bar
require('user.lualine')
