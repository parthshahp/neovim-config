return { 'tpope/vim-fugitive',
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
         }
     }
