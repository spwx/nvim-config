-- set these global options here so plugins use the correct leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

if vim.g.neovide then
  require 'neovide'
end

require 'options'
require 'keymaps'
require 'config.lazy'
