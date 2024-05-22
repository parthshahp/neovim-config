return {
  'zaldih/themery.nvim',
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "Gruvbox Material",
          colorscheme = "gruvbox-material",
          before = [[
            vim.opt.background = "dark"
          ]],
          after = [[
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_foreground = "original"
          ]],
        },
        --   {
        --     name = "Kanagawa",
        --     colorscheme = "kanagawa"
        --   },
        --   {
        --     name = "Catppuccin Mocha",
        --     colorscheme = "catppuccin",
        --     before = [[
        --       require("catppuccin").setup({
        --         flavour = "mocha",
        --         transparent_background = true
        --       })
        --     ]],
        --   }
      },
      themeConfigFile = "~/.config/nvim/lua/parth/config/theme.lua",
    })
  end
}
