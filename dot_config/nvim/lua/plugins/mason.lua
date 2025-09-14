return {

  -- Mason: binary kurulumlarını garanti altına al
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  -- Mason-LSPConfig: hangi LSP server'lar kurulacak?
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { automatic_enable = true },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- -- Önce özel ayarları tanımla
      -- vim.lsp.config("pyright", {
      --   settings = {
      --     python = {
      --       analysis = {
      --         typeCheckingMode = "basic", -- "off" | "basic" | "strict"
      --         autoImportCompletions = true,
      --       },
      --     },
      --   },
      -- })

      -- Sonra enable et
      vim.lsp.enable("pyright")
      vim.lsp.enable("svelte")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("ts_ls") -- guzel ama tam ise yaramiyor? sacma sapan seyler yazinca hata vermiyor

      -- Başka LSP'ler eklemek için:
      -- vim.lsp.enable("jsonls")
      -- vim.lsp.enable("lua_ls")
      vim.lsp.enable("typos_lsp")
    end,
  },
}
