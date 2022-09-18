local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    numbers = "none",

    -- can be a string | function, see "Mouse actions"
    close_command = "Bdelete! %d",     right_mouse_command = "Bdelete! %d",

    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",

    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,

    buffer_close_icon = "",

    modified_icon = "●",

    close_icon = "",

    left_trunc_marker = "",

    right_trunc_marker = "",

    max_name_length = 30,

    -- prefix used when a buffer is de-duplicated
    max_prefix_length = 30,

    tab_size = 25,

    -- | "nvim_lsp" | "coc",
    diagnostics = false,

    diagnostics_update_in_insert = false,

    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },

    show_buffer_icons = true,

    show_buffer_close_icons = true,

    show_close_icon = true,

    show_tab_indicators = true,

    -- whether or not custom sorted buffers should persist
    persist_buffer_sort = true,

    -- | "thick" | "thin" | { 'any', 'any' },
    separator_style = "slant",

    enforce_regular_tabs = true,

    always_show_bufferline = true,
  },

}
