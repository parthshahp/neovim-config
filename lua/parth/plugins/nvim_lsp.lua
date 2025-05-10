return {
  --Mason
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  --LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "saghen/blink.cmp",
    },

    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local options = { buffer = event.buf }
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format({ async = false, id = event.data.client_id })
            end,
          })

          local map = vim.keymap.set
          map("n", "<leader>d", vim.diagnostic.open_float, options)
          map("n", "K", vim.lsp.buf.hover, options)
          -- map("n", "gd", vim.lsp.buf.definition, options)
          -- map("n", "gD", vim.lsp.buf.declaration, options)
          map("n", "<leader>r", vim.lsp.buf.rename, options)
          -- map("n", "gI", vim.lsp.buf.implementation, options)
          -- map("n", "gt", vim.lsp.buf.type_definition, options)
          map("n", "g.", vim.lsp.buf.code_action, options)
        end,
      })
    end,
  },
  --Completion
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        menu = { border = "single" },
        documentation = { auto_show = true, window = { border = "single" } },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
          },
        },
        path = {
          opts = {
            get_cwd = function(_)
              return vim.fn.getcwd()
            end,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = {
        window = { border = "single" },
        enabled = true,
      },
    },
    opts_extend = { "sources.default" },
  },
}
