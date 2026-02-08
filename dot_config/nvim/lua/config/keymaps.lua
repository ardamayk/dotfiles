-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

wk.add({
  -- { "<leader>b", group = "Biome" }, -- Grup başlığı
  {
    "<leader>bf",
    function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll.biome" } },
        apply = true,
      })
    end,
    desc = "Safe Fix All (Biome)",
    mode = "n",
  },
})
