return {
  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = false },
        exclude = {
          filetypes = { "help", "lazy", "mason", "toggleterm" },
        },
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
      -- Hook into cmp if it's loaded
      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  -- Commenting: gcc, gc+motion, gcb
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
      })
    end,
  },

  -- Undo tree
  {
    "jiaoshijie/undotree",
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle undo tree" },
    },
    opts = {
      float_diff = true,
      layout = "left_bottom",
      position = "left",
      window = { border = "rounded" },
      parser = "compact",
    },
    config = function(_, opts)
      require("undotree").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "undotree",
        callback = function(args)
          vim.keymap.set("n", "<Esc>", "<cmd>lua require('undotree').toggle()<cr>",
            { buffer = args.buf, silent = true })
        end,
      })
    end,
  },

  -- Mini: extended text objects + surround
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      -- saiw) add parens, sd' delete quotes, sr)' replace
      require("mini.surround").setup()
    end,
  },

  -- Scroll past EOF
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = { insert_mode = true },
  },
}
