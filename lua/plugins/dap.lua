return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      -- Basic debugging keymaps, feel free to change to your liking!
      vim.keymap.set('n', '<leader>cdc', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<leader>cdi', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<leader>cdo', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>cdO', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>cdb', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>cdB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })
    end,
  },
  {
    {
      'rcarriga/nvim-dap-ui',
      dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio', 'williamboman/mason.nvim' },
      config = function()
        require('dapui').setup()

        local dap, dapui = require 'dap', require 'dapui'
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      end,
    },
  },
}
