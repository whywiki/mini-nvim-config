-- =============================================================================
-- KEYMAPS
-- =============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation (CTRL + hjkl)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize splits with arrows
keymap("n", "<C-Up>",    ":resize +2<CR>",          opts)
keymap("n", "<C-Down>",  ":resize -2<CR>",          opts)
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move lines up/down in visual mode
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered when scrolling / searching
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n",     "nzzzv",   opts)
keymap("n", "N",     "Nzzzv",   opts)

-- Better paste (don't clobber clipboard when pasting over selection)
keymap("v", "p", '"_dP', opts)

-- Clear search highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Save / quit
keymap("n", "<leader>w",  ":w<CR>",  opts)
keymap("n", "<leader>q",  ":q<CR>",  opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>qq", ":qa<CR>", opts)

-- Splits
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>",  opts)

-- Toggle auto-comment continuation
keymap("n", "<leader>tc", function()
  local fo = vim.o.formatoptions
  if fo:find("r") then
    vim.cmd("set formatoptions-=r")
    vim.notify("Auto-comment OFF")
  else
    vim.cmd("set formatoptions+=r")
    vim.notify("Auto-comment ON")
  end
end, { noremap = true, silent = false, desc = "Toggle auto-comment continuation" })
