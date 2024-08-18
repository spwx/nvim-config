-- return {}
return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    require('render-markdown').setup {}
  end,
}
-- return {
--   'OXY2DEV/markview.nvim',
--   lazy = false, -- Recommended
--   -- ft = "markdown" -- If you decide to lazy-load anyway
--   dependencies = {
--     -- You will not need this if you installed the
--     -- parsers manually
--     -- Or if the parsers are in your $RUNTIMEPATH
--     'nvim-treesitter/nvim-treesitter',
--
--     'nvim-tree/nvim-web-devicons',
--   },
-- }
