return { 'tpope/vim-fugitive',
         'tpope/vim-sleuth',
         'numtoStr/Comment.nvim', opts ={}, lazy=true,
         'nvim-tree/nvim-web-devicons',
         {
           'lewis6991/gitsigns.nvim',
           config = function()
             require("gitsigns").setup()
             vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
           end
         }
     }
