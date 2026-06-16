return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs     = package.loaded.gitsigns
        local o      = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set

        keymap("n", "]h",         gs.next_hunk,                  o)
        keymap("n", "[h",         gs.prev_hunk,                  o)
        keymap("n", "<leader>hs", gs.stage_hunk,                 o)
        keymap("n", "<leader>hr", gs.reset_hunk,                 o)
        keymap("n", "<leader>hp", gs.preview_hunk,               o)
        keymap("n", "<leader>gb", gs.toggle_current_line_blame,  o)
      end,
    })
  end,
}
