return {

  -- github colorscheme
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}
    end,
  },

  -- tokyonight colorscheme
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- gruvbox colorscheme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      overrides = {
        SignColumn = { bg = 'NONE' },
        FoldColumn = { bg = 'NONE' },
        GruvboxRedSign = { bg = 'NONE' },
        GruvboxAquaSign = { bg = 'NONE' },
        GruvboxBlueSign = { bg = 'NONE' },
        GruvboxGreenSign = { bg = 'NONE' },
        GruvboxOrangeSign = { bg = 'NONE' },
        GruvboxPurpleSign = { bg = 'NONE' },
        GruvboxYellowSign = { bg = 'NONE' },
      },
    },
    config = true,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'gruvbox'
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE' })

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
