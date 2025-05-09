return {
  --Mason
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { 'neovim/nvim-lspconfig' },
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
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'enter' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = { border = 'single' },
        documentation = { auto_show = true, window = { border = 'single' } },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
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
        window = { border = 'single' },
        enabled = true,
      },
    },
    opts_extend = { "sources.default" },
  },
}
