return {
  --Mason
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        "stylua",
        "prettierd",
        "isort",
        "lua_ls",
        "gopls",
        "pyright",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "svelte-language-server",
      }
    },
    config = function(_, opts)
      require("mason").setup(opts)

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  --LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require("parth.config.nvim_lsp").defaults()
    end
  },
  --Completion
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/nvim-cmp'
  },
  {
    'L3MON4D3/LuaSnip'
  },

}
