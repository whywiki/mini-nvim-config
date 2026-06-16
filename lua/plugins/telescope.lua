-- Requires: git, make, gcc (for fzf-native), ripgrep (for live_grep)
-- Ubuntu: sudo apt install ripgrep build-essential
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      -- If make/gcc aren't available, fzf-native just won't load;
      -- telescope itself will still work with the default sorter.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin   = require("telescope.builtin")

    telescope.setup({
      defaults = {
        prompt_prefix   = " ",
        selection_caret = " ",
        border          = true,
        borderchars     = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons  = true,
        layout_config   = {
          horizontal = { preview_width = 0.55 },
        },
      },
      extensions = {
        fzf = {
          fuzzy                   = true,
          override_generic_sorter = true,
          override_file_sorter    = true,
        },
      },
    })

    -- Load fzf only if it compiled successfully
    pcall(telescope.load_extension, "fzf")

    local o = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>ff", builtin.find_files,  o) -- find files
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,   o) -- grep in files
    vim.keymap.set("n", "<leader>fb", builtin.buffers,     o) -- open buffers
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,   o) -- help
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles,    o) -- recent files
    vim.keymap.set("n", "<leader>fk", builtin.keymaps,     o) -- keymaps
  end,
}
