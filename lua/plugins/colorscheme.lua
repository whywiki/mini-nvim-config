return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false, -- no kitty in docker, keep solid bg
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
      },
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
