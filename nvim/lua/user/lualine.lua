local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end



local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic"},
  sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
  "mode",
  fmt = function(str)
    return "  " .. str .. " "
  end,
}

local location = {
  "location",
  fmt = function(str)
    return "*" .. str .. " "
  end,
}

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = {
  " ········",
  " ·······",
  " ······",
  " ·····",
  " ····",
  " ···",
  " ··",
  " ·",
  " "
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      "alpha",
      "dashboard",
      "NvimTree",
      "Outline",
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diff, diagnostics },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = { location },
    lualine_z = { progress }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
