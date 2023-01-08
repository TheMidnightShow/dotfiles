local bufferline = require("bufferline")

bufferline.setup
{
  highlights =
  {
    fill = {
        fg = "#0f080e",
        bg = "#0f080e",
    },
    background = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    tab = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    tab_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    tab_close = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    close_button = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    close_button_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    close_button_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    buffer_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    buffer_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    hint = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    hint_visible = {
        fg = "#000000",
        bg = "#000000"
    },
    hint_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    hint_diagnostic = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    hint_diagnostic_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    hint_diagnostic_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    info = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    info_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    info_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    info_diagnostic = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    info_diagnostic_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    info_diagnostic_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    warning = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    warning_visible = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    warning_selected = {
        fg = "#ccaa9e",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    warning_diagnostic = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    warning_diagnostic_visible = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    warning_diagnostic_selected = {
        fg = "#ccaa9e",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    error = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    error_visible = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    error_selected = {
        fg = "#ccaa9e",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    error_diagnostic = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    error_diagnostic_visible = {
        fg = "#ccaa9e",
        bg = "#0f080e"
    },
    error_diagnostic_selected = {
        fg = "#ccaa9e",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    modified = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    modified_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    modified_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
    },
    duplicate_selected = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        italic = true,
    },
    duplicate_visible = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        italic = true
    },
    duplicate = {
        fg = "#c9c9c9",
        bg = "#0f080e",
        italic = true
    },
    separator =
    {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    indicator_selected =
    {
        fg = "#c9c9c9",
        bg = "#0f080e"
    },
    pick_selected =
    {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    pick_visible =
    {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    pick =
    {
        fg = "#c9c9c9",
        bg = "#0f080e",
        bold = true,
        italic = true,
    },
    offset_separator = {
        fg = "#c9c9c9",
        bg = "#0f080e",
    },
  },

  options =
  {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator =
    {
        style = false,
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)  -- buf contains:
      return "/ "..buf.name.." /"
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = false,
    offsets =
    {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true
        }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = false,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = { ' ▎', ' ▎' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
    sort_by = 'insert_at_end',
  },
}
