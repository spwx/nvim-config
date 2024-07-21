vim.o.guifont = 'VictorMono Nerd Font:h22' -- text below applies for VimScript
vim.g.neovide_hide_mouse_when_typing = true

-- -- Helper function for transparency formatting
-- local alpha = function()
--   return string.format('%x', math.floor(255 * (vim.g.transparency or 0.8)))
-- end
-- -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
-- vim.g.neovide_transparency = 0.0
-- vim.g.transparency = 0.9
-- vim.g.neovide_background_color = '#0f1117' .. alpha()
