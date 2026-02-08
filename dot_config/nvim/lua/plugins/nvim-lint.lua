return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      -- hangi linters hangi filetype için
      lint.linters_by_ft = {
        dockerfile = { "hadolint", "trivy" }, --> hadolint Dockerfile icindeki hatalari bulur, trivy ise guvenlik aciklarini tarar. trivy terminalden calistirmak daha mantikli olabilir.
      }

      -- autocmd ile kaydederken veya açarken lint çalıştır
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        pattern = { "Dockerfile" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
