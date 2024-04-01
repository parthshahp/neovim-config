return { 
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'nvim-tree/nvim-web-devicons',
  {
    'numtoStr/Comment.nvim', opts ={}, lazy=false,
    config = function()
      require("Comment").setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "RRethy/vim-illuminate",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  } 
}
