return {
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'nmac427/guess-indent.nvim',
    config = true,
  },
  -- {
  --   'shellRaining/hlchunk.nvim',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     require('hlchunk').setup {
  --       chunk = {
  --         enable = true,
  --         -- ...
  --       },
  --       indent = {
  --         enable = true,
  --         -- ...
  --       },
  --     }
  --   end,
  -- },
}
