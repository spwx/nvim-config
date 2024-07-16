return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      spec = {
        { '<leader>w', group = 'window' },
        { '<leader>c', group = 'code' },
        { '<leader>cd', group = 'debugger' },
        { '<leader>cs', group = 'symbols' },
        { '<leader>cx', group = 'trouble' },
        { '<leader>t', group = 'telescope' },
        { '<leader>o', group = 'obsidian', icon = { icon = '󰯂', hl = 'WhichKeyPurple', color = 'purple' } },
        { '<leader>b', group = 'buffer' },
        {
          mode = { 'n', 'v' }, -- NORMAL and VISUAL mode
          { '<leader>q', '<cmd>q<cr>', desc = 'Quit' }, -- no need to specify mode since it's inherited
        },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
}
