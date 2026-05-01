-- return {
--   {
--     "lervag/vimtex",
--     lazy = false,
--     init = function()
--       vim.g.vimtex_view_method = "zathura"
--       vim.g.vimtex_compiler_method = "tectonic"
--
--       vim.g.vimtex_compiler_tectonic = {
--         -- outdir argümanı VimTeX tarafından otomatik yönetilir,
--         -- buraya sadece ek bayrakları yazıyoruz.
--         options = {
--           "--keep-logs",
--           "--keep-intermediates",
--           "--synctex",
--         },
--         -- Build klasörü ayarı
--         out_dir = "build",
--       }
--     end,
--   },
-- }
return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",
        options = {
          "-lualatex", -- Tectonic hızı ve modernliğine en yakın budur
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
        out_dir = "build",
      }
    end,
  },
}
