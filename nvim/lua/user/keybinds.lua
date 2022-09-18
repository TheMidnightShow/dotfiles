local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------
----------------------- Modes -------------------------
-------------------------------------------------------

  -->   normal_mode   = "n"
  -->   insert_mode   = "i"
  -->   visual_mode   = "v"
  -->   term_mode     = "t"
  -->   command_mode  = "c"

--------------------------------------------------------
-------------------- Normal  Mode ----------------------
--------------------------------------------------------

--> easy file save & quit
  keymap("n", "<C-s>", ":w <CR>", opts)
  keymap("n", "<C-q>", ":wq <CR>", opts)
  keymap("n", "<C-p>", ":q! <CR>", opts)

--> fast chunk navigation
  keymap("n", "<S-k>", "{", opts)
  keymap("n", "<S-j>", "}", opts)

--> better window navigation
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)

--> easy window split
  keymap("n", "<C-v>", "<C-w>v", opts)
  keymap("n", "<C-b>", "<C-w>s", opts)

--> Resize with arrows
  keymap("n", "<C-Up>", ":resize -2<CR>", opts)
  keymap("n", "<C-Down>", ":resize +2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--> Navigate buffers
  keymap("n", "<S-l>", ":bnext<CR>", opts)
  keymap("n", "<S-h>", ":bprevious<CR>", opts)


--------------------------------------------------------
------------------------ Insert ------------------------
--------------------------------------------------------

--> easy return to normal mode
  keymap("i", "fj", "<ESC>", opts)
  keymap("i", "jf", "<ESC>", opts)


--------------------------------------------------------
------------------------ Visual ------------------------
--------------------------------------------------------

--> easy return to normal mode
  keymap("v", "jf", "<ESC>", opts)
  keymap("v", "fj", "<ESC>", opts)

--> easy indent 
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

--> Move text up and down
  keymap("v", "p", '"_dP', opts)

--------------------------------------------------------
------------------------ Plugin ------------------------
--------------------------------------------------------

--> toggle term
  keymap("n", "<C-t>", ":ToggleTerm <CR>", opts)

--> nvim tree
  keymap("n", "<C-f>", ":NvimTreeToggle <CR>", opts)
