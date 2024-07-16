return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'mfussenegger/nvim-dap',
    },
    ft = 'rust',
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          float_win_config = { border = 'rounded' },
          code_actions = {
            ui_select_fallback = true,
          },
        },
        server = {
          on_attach = function(client)
            local wk = require 'which-key'
            wk.add {
              { '<leader>cr', group = 'rustaceanvim' },
            }

            -- you can also put keymaps in here
            -- TODO: this isn't working
            -- vim.cmd.RustLsp { 'flyCheck', 'run' }
            -- TODO: Something is wrong with `ui_select_fallback`
            -- vim.keymap.set('n', '<leader>ca', function()
            --   vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
            --   -- or vim.lsp.buf.codeAction() if you don't want grouping.
            -- end, { silent = true, buffer = true, desc = 'Code Actions' })
            vim.keymap.set('n', '<leader>crr', function()
              vim.cmd.RustLsp 'run'
            end, { silent = true, buffer = true, desc = 'Run under cursor' })
            vim.keymap.set('n', '<leader>crR', function()
              vim.cmd.RustLsp 'runnables'
            end, { silent = true, buffer = true, desc = 'List runnables' })
            vim.keymap.set('n', '<leader>crT', function()
              vim.cmd.RustLsp 'testables'
            end, { silent = true, buffer = true, desc = 'List testables' })
            vim.keymap.set('n', '<leader>crt', function()
              vim.cmd.RustLsp { 'testables', bang = true }
            end, { silent = true, buffer = true, desc = 'Rerun last test' })
            vim.keymap.set('n', '<leader>cro', function()
              vim.cmd.RustLsp 'openCargo'
            end, { silent = true, buffer = true, desc = 'Open Cargo.toml' })
            vim.keymap.set('n', '<leader>cre', function()
              vim.cmd.RustLsp 'explainError'
            end, { silent = true, buffer = true, desc = 'Explain next error' })
            vim.keymap.set('n', '<leader>crd', function()
              vim.cmd.RustLsp 'renderDiagnostic'
            end, { silent = true, buffer = true, desc = 'Explain next diagnostic' })
            vim.keymap.set('n', '<leader>crD', function()
              vim.cmd.RustLsp 'openDocs'
            end, { silent = true, buffer = true, desc = 'Open on docs.rs' })
            vim.keymap.set('n', '<leader>crp', function()
              vim.cmd.RustLsp 'parentModule'
            end, { silent = true, buffer = true, desc = 'Go to parent module' })
            vim.keymap.set('n', 'J', function()
              vim.cmd.RustLsp 'joinLines'
            end, { silent = true, buffer = true, desc = 'Go to parent module' })
          end,
        },
      }

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('RustInlayHints', { clear = true }),
        pattern = 'rust',
        callback = function()
          vim.lsp.inlay_hint.enable()
        end,
      })
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      -- require('crates').setup { popup = { autofocus = true } }
      require('crates').setup {
        completion = {
          cmp = { enabled = true },
          crates = {
            enabled = true,
            min_chars = 3,
            max_results = 8,
          },
        },
      }
    end,
    init = function()
      -- set keymaps
      local set_keymaps = function()
        local crates = require 'crates'
        -- the `buffer = true` option only loads the keymap for the current buffer
        vim.keymap.set('n', '<leader>cct', crates.toggle, { silent = true, desc = 'Toggle', buffer = true })
        vim.keymap.set('n', '<leader>ccr', crates.reload, { silent = true, desc = 'Reload', buffer = true })

        vim.keymap.set('n', '<leader>ccv', crates.show_versions_popup, { silent = true, desc = 'Show versions', buffer = true })
        vim.keymap.set('n', '<leader>ccf', crates.show_features_popup, { silent = true, desc = 'Show features', buffer = true })
        vim.keymap.set('n', '<leader>ccd', crates.show_dependencies_popup, { silent = true, desc = 'Show dependencies', buffer = true })

        vim.keymap.set('n', '<leader>ccu', crates.update_crate, { silent = true, desc = 'Update to compatible version', buffer = true })
        vim.keymap.set('v', '<leader>ccu', crates.update_crates, { silent = true, desc = 'Update to compatible version', buffer = true })
        vim.keymap.set('n', '<leader>cca', crates.update_all_crates, { silent = true, desc = 'Update all to compatible version', buffer = true })
        vim.keymap.set('n', '<leader>ccU', crates.upgrade_crate, { silent = true, desc = 'Upgrade crate', buffer = true })
        vim.keymap.set('v', '<leader>ccU', crates.upgrade_crates, { silent = true, desc = 'Upgrade selected crates', buffer = true })
        vim.keymap.set('n', '<leader>ccA', crates.upgrade_all_crates, { silent = true, desc = 'Upgrade all crates', buffer = true })

        vim.keymap.set('n', '<leader>ccx', crates.expand_plain_crate_to_inline_table, { silent = true, desc = 'Expand to table', buffer = true })
        vim.keymap.set('n', '<leader>ccX', crates.extract_crate_into_table, { silent = true, desc = 'Promote a depency', buffer = true })

        vim.keymap.set('n', '<leader>ccH', crates.open_homepage, { silent = true, desc = 'Open homepage', buffer = true })
        vim.keymap.set('n', '<leader>ccR', crates.open_repository, { silent = true, desc = 'Open Repo', buffer = true })
        vim.keymap.set('n', '<leader>ccD', crates.open_documentation, { silent = true, desc = 'Open on docs.rs', buffer = true })
        vim.keymap.set('n', '<leader>ccC', crates.open_crates_io, { silent = true, desc = 'Open on crates.io', buffer = true })
        vim.keymap.set('n', '<leader>ccL', crates.open_lib_rs, { silent = true, desc = 'Open on lib.rs', buffer = true })
      end

      local group = vim.api.nvim_create_augroup('CratesKeymap', { clear = true })

      -- load keys for rust files
      -- vim.api.nvim_create_autocmd('FileType', {
      --   group = group,
      --   pattern = 'rust',
      --   callback = set_keymaps,
      -- })

      -- load keys for Cargo.toml
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        group = group,
        pattern = 'Cargo.toml',
        callback = set_keymaps,
      })
    end,
  },
}
