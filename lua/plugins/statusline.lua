-- get the current highlight of the Filename section of the status bar
Unmodified = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineFilename', link = false })

-- Update the Unmodified highlight when the colorscheme changes
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('ColorSchemeGroup', { clear = true }),
  pattern = '*',
  callback = function()
    Unmodified = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineFilename', link = false })
  end,
})

-- utility function to shallow copy a table
local shallow_copy = function(original)
  local copy = {}
  for key, value in pairs(original) do
    copy[key] = value
  end
  return copy
end

-- Update the statusline when a file in modified
local function update_statusline_highlight()
  local modified = shallow_copy(Unmodified)
  modified.bold = true

  if Unmodified.reverse then
    modified.bg = 0xfabd2f
  else
    modified.fg = 0xfabd2f
  end

  if vim.bo.modified then
    vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', modified)
  else
    vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', Unmodified)
  end
end

-- Create an autocommand group
local group = vim.api.nvim_create_augroup('StatusLineHighlight', { clear = true })

-- Add autocommands to update the statusline highlight
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'TextChanged', 'TextChangedI' }, {
  group = group,
  callback = update_statusline_highlight,
})

return {}
