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
        { '<leader>b', group = 'buffer' },
        { '<leader>n', group = 'org-mode', icon = { icon = '', hl = 'WhichKeyGreen', color = 'green' } },
        { '<leader>o', group = 'obsidian', icon = { icon = '󰯂', hl = 'WhichKeyPurple', color = 'purple' } },
        { '<leader>g', group = 'git', icon = { icon = '󰊢', hl = 'WhichKeyColorOrange', color = 'orange' } },
        {
          mode = { 'n', 'v' }, -- NORMAL and VISUAL mode
          { '<leader>q', '<cmd>q<cr>', desc = 'Quit' }, -- no need to specify mode since it's inherited
          { '<leader>l', '<cmd>Lazy<cr>', desc = 'Lazy' },
          { '<leader>s', '<cmd>w<CR>', desc = 'Save', icon = { icon = '󰆓', hl = 'WhichKeyYellow', color = 'yellow' } },
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
