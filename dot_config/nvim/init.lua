-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set relativenumber
vim.opt.relativenumber = true
-- Global olarak 2 ayarla
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Her dosya türü için açıldığında tekrar uygula (plugin override'larını ezer)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- neovim my keymaps
-- ctrl d
vim.keymap.set(
  "n",
  "<C-d>",
  "<C-d>zz",
  { silent = true, noremap = true, desc = "after ctrl + d command ortala screen" }
)
-- ctrl u
vim.keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  { silent = true, noremap = true, desc = "after ctrl + u command ortala screen" }
)
vim.keymap.set("n", "p", "p ", { silent = true, noremap = true })

-- always make .bash_function seen as bash script
vim.filetype.add({
  filename = {
    [".bash_function"] = "sh",
  },
})

vim.opt.shiftwidth = 2

-- spell checking
vim.opt.spelllang = "en_us,tr"
-- vim.opt.spell = true
-- vim.opt.spelloptions = "camel" -- lazyvim default configlerden dolayi is yapmıyor.

-- vim.lsp.enable("pyright")

-- TODO: calismiyor ama calismasi gerekiyor. cunku v . ile explorer actiktan .ts buffer'a gecince ilk acilan buffer'in filetype ini detect etmiyor. Diger file'larin ft sini detect ediyor.
-- -- lazy.nvim yüklendikten sonra
-- vim.schedule(function()
--   vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--     callback = function(args)
--       local buf = args.buf
--       -- Sadece normal dosya buffer’ları için
--       if vim.bo[buf].buftype == "" then
--         -- Filetype detect
--         if vim.bo[buf].filetype == "" then
--           vim.cmd("filetype detect")
--         end
--         -- Treesitter highlight
--         if pcall(vim.treesitter.get_parser, buf) then
--           vim.treesitter.start(buf)
--         end
--       end
--     end,
--   })
-- end)

-- -- Lua init.lua için
-- vim.keymap.set("n", "<C-j>", ":cnext<CR>", { silent = true })
-- vim.keymap.set("n", "<C-k>", ":cprev<CR>", { silent = true })

-- init.lua veya lua/options.lua içine ekleyebilirsin
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "compose.yaml", "docker-compose.yaml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})
