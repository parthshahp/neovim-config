return {
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function() vim.print("setup kanagawa") end,
  }
}
