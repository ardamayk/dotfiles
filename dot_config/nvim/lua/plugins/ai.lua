return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          -- enabled = true,
          auto_trigger = true,
          -- debounce = 75,
          -- keymap = {
          --   accept = "<C-l>",
          --   next = "<C-n>",
          --   prev = "<C-p>",
          --   dismiss = "<C-e>",
          -- },
        },
      })
    end,
  },
}
