-- For some reason, this causes issues with rustaceanvim's nvim-dap integration
-- -- change the symbols for diagnostics
local symbols = { Error = '󰅙', Info = '󰋼', Hint = '󰌵', Warn = '' }

for name, icon in pairs(symbols) do
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
--
-- -- do not show diagnostics in the status column
-- vim.diagnostic.config { signs = false }

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'WarningMsg', linehl = '', numhl = '' })

return {
  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require('nvim-lightbulb').setup {
        autocmd = { enabled = true },
      }
    end,
  },
  {
    'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        -- configuration goes here, for example:
        segments = {
          -- {
          --   sign = { namespace = { 'diagnostic/signs' }, maxwidth = 1, colwidth = 2, auto = false },
          --   click = 'v:lua.ScSa',
          -- },
          -- {
          --   sign = { namespace = { 'gitsign' }, maxwidth = 1, colwidth = 1, wrap = true },
          --   click = 'v:lua.ScSa',
          -- },
          -- { text = { builtin.lnumfunc }, auto = true, click = 'v:lua.ScLa' },
          -- {
          --   sign = { namespace = { 'diagnostic/signs' }, maxwidth = 1, auto = false },
          --   click = 'v:lua.ScSa',
          -- },
          -- {
          --   sign = { text = { '💡' }, maxwidth = 1, colwidth = 2, auto = false, wrap = false },
          --   click = 'builtin.toggle_breakpoint',
          -- },
          -- {
          --   sign = { text = { '💡' }, maxwidth = 1, colwidth = 2, auto = false, wrap = false },
          --   click = 'builtin.toggle_breakpoint',
          -- },
          -- {
          --   sign = { text = { '.*' }, maxwidth = 1, colwidth = 1, auto = true, wrap = false },
          --   click = 'v:lua.ScSa',
          -- },
          {
            sign = { namespace = { 'gitsign' }, maxwidth = 1, colwidth = 1, wrap = true },
            click = 'v:lua.ScSa',
          },
          {
            sign = { name = { '.*' }, maxwidth = 1, colwidth = 2, wrap = true, auto = true },
            click = 'v:lua.ScSa',
          },
          {
            sign = { name = { 'DapBreakpoint' }, maxwidth = 1, colwidth = 2, auto = true, wrap = false },
            click = 'builtin.toggle_breakpoint',
          },
          -- { text = { builtin.foldfunc }, click = 'v:lua.ScFa', auto = true },
          -- add an extra column for Nerd Fonts fold glyphs
          -- { text = { ' ' }, hl = 'FoldColumn' },
          {
            sign = { text = { '💡' }, maxwidth = 1, colwidth = 2, auto = true, wrap = false },
          },
          -- {
          --   sign = { namespace = { 'diagnostic/signs' }, maxwidth = 1, auto = false },
          --   click = 'v:lua.ScSa',
          -- },
        },
      }
    end,
  },
}
