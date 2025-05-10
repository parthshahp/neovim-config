return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup(
      )
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Open Git Preview Hunk" })
      vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
    end,
  },
}
