return {

  -- Mason: binary kurulumlarını garanti altına al
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Mason-LSPConfig: hangi LSP server'lar kurulacak?
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- automatic_enable = true, -- bir ise yaramiyor?
      ensure_installed = {
        "pyright", -- bunun yerine ruff kullaniyorum, formatter olarak. linter olarak bakilmasi gerekiyor. intellisense yok sanirim?
        "ruff",
        "html",
        "cssls",
        "bashls",
        "jsonls",
        "lua_ls",
        "ts_ls",
        "prettier",
        "svelte",
        "tailwindcss",
        "typos_ls",
        "sfmt",
        -- "tree-sitter-cli" --> ?
      },
    },
    -- dependencies = {
    --   { "mason-org/mason.nvim", opts = {} },
    --   "neovim/nvim-lspconfig",
    -- },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Başka LSP'ler eklemek için:
      -- vim.lsp.enable("jsonls")
      vim.lsp.enable("lua_ls")

      vim.lsp.enable("svelte") -- svelte
      vim.lsp.enable("ts_ls") -- guzel ama tam ise yaramiyor? sacma sapan seyler yazinca hata vermiyor -- ? emin degilim, daha iyisi bulunabilir mi?
      vim.lsp.enable("typos_lsp") -- general
      vim.lsp.enable("bashls") -- bash, zshell gormuyor sadece .sh dosyasi goruyor.
      vim.lsp.enable("cssls") -- css
      vim.lsp.enable("tailwindcss") -- tailwindcss, sadece klasorde config dosyasi olunca calisiyor?
      vim.lsp.enable("biome") -- js, ts, formatter?, sadece biome.js klasorde config dosyasi olunca calisiyor?
      vim.lsp.enable("ruff") -- python
      -- vim.lsp.enable("emmet_ls")
      vim.lsp.enable("pyright") -- lsp ile intellisense ile oto kod tamamlama icin var.
    end,
  },
}
