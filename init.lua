-- set these global options here so plugins use the correct leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

if vim.g.neovide then
  require 'neovide'
end

-- adjust the terminal bg color to match the current neovim colorscheme
-- https://old.reddit.com/r/neovim/comments/1ehidxy/you_can_remove_padding_around_neovim_instance/
vim.api.nvim_create_autocmd({ 'UIEnter', 'ColorScheme' }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    if not normal.bg then
      return
    end
    io.write(string.format('\027]11;#%06x\027\\', normal.bg))
  end,
})

vim.api.nvim_create_autocmd('UILeave', {
  callback = function()
    io.write '\027]111\027\\'
  end,
})

require 'options'
require 'keymaps'
require 'config.lazy'
