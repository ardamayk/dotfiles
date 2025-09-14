return {
  -- -- Norcalli (orijinal), eski proje, gelistirimi devam etmiyor.
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   name = "colorizer_norcalli",
  --   enabled = false,
  --   lazy = false, -- indirir, tetikleyene kadar yüklemez
  -- },

  -- -- NvChad fork, nvchad norcallininkini forklamis ve sonra  catgoose a devretmis projeyi
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   name = "colorizer_nvchad",
  --   enabled = false,
  --   lazy = false,
  --   opts = {
  --     user_default_options = {
  --       mode = "background",
  --       names = false,
  --     },
  --   },
  -- },

  -- catgoose fork, gelistirimi devam etmekte
  {
    "catgoose/nvim-colorizer.lua",
    name = "colorizer_catgoose",
    enabled = true,
    lazy = false,
    opts = {
      user_default_options = {
        mode = "background",
        names = false,
        tailwind = true,
      },
    },
  },
}
