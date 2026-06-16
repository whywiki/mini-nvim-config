return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping  = [[<c-\>]],
      direction     = "float",
      float_opts    = { border = "rounded" },
      start_in_insert = true,
      persist_mode  = true,
      autochdir     = true,
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local o = { buffer = 0 }
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]],          o)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]],   o)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]],   o)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]],   o)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]],   o)
      end,
    })
  end,
}
