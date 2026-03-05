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
