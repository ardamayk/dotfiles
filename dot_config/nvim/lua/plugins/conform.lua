-- ~/.config/nvim/lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {

      -- LaTeX tex = { "bibtex-tidy", "latexindent" },
      -- Web
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },

      -- Svelte
      svelte = { "prettier" },
      -- svelte kullanirken proje kokone .prettierrc ye asagidaki satirin eklenmesi gerekiyor
      -- "plugins": ["prettier-plugin-svelte", "prettier-plugin-tailwindcss"]

      -- Lua
      lua = { "stylua" },

      -- Shell
      sh = { "shfmt" },

      -- -- Python
      -- python = { "black" },
    },
  },
}
