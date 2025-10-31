return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        json = { "prettierd" },
        go = { "gofumpt", "golines" },
        python = { "isort", "black" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },
    })
    -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    -- 	conform.format({
    -- 		lsp_fallback = true,
    -- 		async = false,
    -- 		timeout_ms = 500,
    -- 	})
    -- end, { desc = "Format file" })
  end,
}
