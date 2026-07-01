-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Escape insert mode with 'jk'
vim.keymap.set("i", "jk", "<ESC>", { silent = true, desc = "Escape insert mode" })

-- Clear last used search pattern / highlight
vim.keymap.set("n", "<leader>c", function()
  vim.fn.setreg("/", "")
end, { desc = "Clear search highlight" })
