-- =============================================================================
-- OPTIONS
-- =============================================================================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = true
opt.colorcolumn = ""

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Files
-- No swap, no backup (container is ephemeral anyway)
-- Undo is worth keeping — survives within a session
opt.swapfile = false
opt.backup = false
opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir

-- Clipboard
-- unnamedplus works if the container has xclip/xsel or you use -e DISPLAY.
-- Uncomment if you have it; safe to leave commented otherwise.
-- opt.clipboard = "unnamedplus"

-- Performance
opt.updatetime = 50
opt.timeoutlen = 300

-- UI
opt.showmode = false
opt.pumheight = 10
opt.conceallevel = 0

-- Suppress LSP log noise
vim.lsp.log.set_level("off")

-- Nice symbol for nvim difftool
vim.opt.fillchars:append({ diff = "╱" })
