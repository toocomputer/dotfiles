-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- lua/config/keymaps.lua
-- Custom keymaps ported from old Neovim config.
-- LazyVim defaults (n/N centering, <C-hjkl> window nav, <leader>e explorer,
-- <leader>bd buffer close, etc.) are intentionally NOT redefined here —
-- they already do what the old config's equivalents were trying to do.

-- Escape insert mode with 'jk'
vim.keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Escape insert mode" })

-- Source current file / execute Lua line or selection
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line as Lua" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection as Lua" })

-- Clear last used search pattern / highlight
vim.keymap.set("n", "<leader>c", function()
  vim.fn.setreg("/", "")
end, { desc = "Clear search highlight" })

--
-- <leader>l defined twice in old config (window-right-jump, then
--   command-area-clear) — the second silently won. Neither is ported here;
--   pick whichever behavior you actually want and add it back deliberately
--   if LazyVim doesn't already cover it.
