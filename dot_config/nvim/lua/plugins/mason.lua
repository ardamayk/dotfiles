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
        -- "typos_ls",
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
    -- json semalarini indiriyoruz ve jsonls e yukluyoruzki lsp kullanabilelim.
    "b0o/SchemaStore.nvim",
    lazy = true,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Başka LSP'ler eklemek için:
      -- vim.lsp.enable("jsonls")
      vim.lsp.enable("lua_ls")

      vim.lsp.enable("svelte") -- svelte
      vim.lsp.enable("ts_ls") -- guzel ama tam ise yaramiyor? sacma sapan seyler yazinca hata vermiyor -- ? emin degilim, daha iyisi bulunabilir mi?
      -- vim.lsp.enable("typos_lsp") -- general
      vim.lsp.enable("bashls") -- bash, zshell gormuyor sadece .sh dosyasi goruyor.
      vim.lsp.enable("cssls") -- css
      vim.lsp.enable("tailwindcss") -- tailwindcss, sadece klasorde config dosyasi olunca calisiyor?
      -- WARNING: biome lsp'si formatlama yapmiyor. Bunun icin conform yardimi ile biome formatlama yapilabilir.
      vim.lsp.enable("biome") -- js, ts, formatter?, sadece biome.js klasorde config dosyasi olunca calisiyor?
      vim.lsp.enable("ruff") -- python
      -- vim.lsp.enable("dockerls")
      -- vim.lsp.enable("emmet_ls")
      vim.lsp.enable("pyright") -- lsp ile intellisense ile oto kod tamamlama icin var.
      vim.lsp.enable("docker_compose_language_service") --> docker-compose dosyalari icin
      vim.lsp.enable("dockerls") --> Docker file icindeki hover ile keywordu acikliyor
      vim.lsp.enable("eslint")

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      vim.lsp.enable("yamlls") -- yamlls

      -- RUMDL AYARLARI
      -- 1. lspconfig modülünü çağırın
      local lspconfig = require("lspconfig")

      -- 2. lspconfig'in dahili "configs" modülünü çağırın
      -- Bu, özel sunucuyu lspconfig'in tanıması için GEREKLİ olan kısımdır.
      local configs = require("lspconfig.configs")

      -- 3. 'rumdl' sunucusunu lspconfig'in configs tablosuna ekleyin
      -- Bu kontrol, config dosyasının tekrar yüklenmesi durumunda hata vermesini önler.
      if not configs.rumdl then
        configs.rumdl = {
          default_config = {
            -- RUMDL .rumdl.toml dosyasinin pakete ozgu veya global bir sekilde .config/rumdl/.rumdl.toml olarak tanimlanmasini zorunlu kilar
            cmd = { "rumdl", "server", "--stdio" },
            filetypes = { "markdown" },

            -- root_dir ayarınız: lspconfig.util'i kullanmak doğru
            -- root_dir = lspconfig.util.root_pattern(".git", ".rumdl.toml", "pyproject.toml"),
            root_dir = function()
              -- Her zaman geçerli dizini (veya Neovim'in açıldığı dizini) root olarak kabul et.
              -- Bu, dosya nerede olursa olsun LSP'nin başlatılmasını sağlar.
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end

      -- 4. Yeni eklenen 'rumdl' sunucusunu setup() ile başlatın
      lspconfig.rumdl.setup({})

      -- Sunucuya snippet desteğimiz olduğunu bildiriyoruz
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- JSONLS AYARLARI
      -- jsonls ayarları
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        settings = {
          json = {
            -- Şemaları otomatik tanıması için
            schemas = require("schemastore").json.schemas(), -- (Opsiyonel ama tavsiye edilir)
            validate = { enable = true },
          },
        },
      })

      -- Snippet to enable the language server: >lua
      vim.lsp.enable("jsonls")

      -- Eski config ayarlama yontemi, JSONLS icin yaptim. Yukarilariler gecerli oluyor, Bu da gecerli oluyor ama yukaridakini yazmak daha kolay!
      -- -- lspconfig.jsonls.setup({
      -- --   -- capabilities = capabilities,
      -- --   settings = {
      -- --     json = {
      -- --       -- Şemaları otomatik tanıması için
      -- --       schemas = require("schemastore").json.schemas(), -- (Opsiyonel ama tavsiye edilir)
      -- --       validate = { enable = true },
      -- --     },
      -- --   },
      -- -- })
    end,
  },
}
