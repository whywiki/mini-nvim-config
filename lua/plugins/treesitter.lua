-- Requires: gcc, g++, nodejs (for some parsers)
-- Ubuntu: sudo apt install gcc g++ nodejs
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- ROS2-relevant parsers only — keeps install fast
    require("nvim-treesitter").install({
      "c", "cpp",           -- C/C++ (main ROS2 languages)
      "python",             -- launch files, scripts
      "bash",               -- shell scripts
      "cmake",              -- CMakeLists.txt
      "lua",                -- nvim config itself
      "json", "yaml",       -- package.json, ros params
      "xml",                -- URDF, SDF, launch XML
      "vim", "vimdoc",
    }):wait(300000)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
