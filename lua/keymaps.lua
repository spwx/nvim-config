-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>cxe', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cxq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--- mine
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bD', '<cmd>bd!<CR>', { desc = 'Force Delete buffer' })
vim.keymap.set('n', '<leader>`', '<cmd>:b#<CR>', { desc = 'Last buffer' })

-- windows
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Create vsplit' })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Create hsplit' })
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<leader>wj', '<c-w><c-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<leader>wk', '<c-w><c-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<leader>wo', '<C-w><C-o>', { desc = 'Current window only' })

-- vim: ts=2 sts=2 sw=2 et
