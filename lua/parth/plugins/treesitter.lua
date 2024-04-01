return {
  {
    'nvim-treesitter/nvim-treesitter',
    version= false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({    
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "python",
          "go",
          "javascript",
          "html",
          "css",
        },
      })
    end
  },
  {
    'nvim-treesitter/playground',
  }
}
