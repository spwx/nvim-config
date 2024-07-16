return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'rustaceanvim.neotest',
      },
    }
    vim.keymap.set('n', '<leader>ct', require('neotest').summary.toggle, { desc = 'Toggle test summary' })
  end,
}
