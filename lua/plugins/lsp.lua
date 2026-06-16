-- No Mason — servers are installed via apt / pip instead:
--
--   sudo apt install clangd          # C/C++ (core ROS2)
--   sudo apt install python3-pip
--   pip3 install pyright             # Python launch files / scripts
--   sudo apt install bash-language-server   # optional: bash
--
-- Nothing here will crash if a server isn't installed; lspconfig just
-- silently skips servers whose binary isn't found.

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- capabilities (loaded with completion plugin)
    },
    config = function()
      -- Shared keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(args)
          local o      = { noremap = true, silent = true, buffer = args.buf }
          local keymap = vim.keymap.set

          keymap("n", "gd",          vim.lsp.buf.definition,    o)
          keymap("n", "gD",          vim.lsp.buf.declaration,   o)
          keymap("n", "gr",          vim.lsp.buf.references,    o)
          keymap("n", "gi",          vim.lsp.buf.implementation, o)
          keymap("n", "K",           vim.lsp.buf.hover,         o)
          keymap("n", "<leader>rn",  vim.lsp.buf.rename,        o)
          keymap("n", "<leader>ca",  vim.lsp.buf.code_action,   o)
          keymap("n", "<leader>d",   vim.diagnostic.open_float, o)
          keymap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, o)
          keymap("n", "]d", function() vim.diagnostic.jump({ count =  1 }) end, o)

          -- Copy diagnostic message under cursor to clipboard
          keymap("n", "<leader>dy", function()
            local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
            if #diags > 0 then
              vim.fn.setreg("+", diags[1].message)
              vim.api.nvim_echo({ { " diagnostic copied", "DiagnosticInfo" } }, false, {})
            end
          end, o)
        end,
      })

      -- Enhanced capabilities from cmp (graceful if cmp not loaded)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities()
      end

      local lspconfig = require("lspconfig")

      -- C/C++ — install with: sudo apt install clangd
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy" },
      })

      -- Python — install with: pip3 install pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Bash — install with: sudo apt install bash-language-server  (optional)
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
