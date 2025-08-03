vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Open Lexplore
vim.keymap.set("n", "<leader>b", "<Esc>:Lex<CR>:vertical resize 30<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<leader>b", "<Esc>:Lex<CR>:vertical resize 30<CR>", { noremap = true, silent = true })

-- Jump to left split window
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })

-- Jump to right split window
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })

-- Jump to top split window
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })

-- Jump to bottom split window
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })

-- Jump to next paragraph and center view
vim.keymap.set('n', '<leader>d', '<C-d>zz')

-- Jump to previous paragraph and center view
vim.keymap.set('n', '<leader>u', '<C-u>zz')

-- Search for next occurrence + center cursor vertically
vim.keymap.set('n', 'n', 'nzzz')

-- Search for previous occurrence + center cursor vertically
vim.keymap.set('n', 'N', 'nzzz')

-- Clear the command area
vim.keymap.set("n", "<leader>l", "<C-l>")

-- Clear last used search pattern
vim.api.nvim_set_keymap('n', '<leader>c', ':let @/ = ""<CR>', { noremap = true, silent = true })

-- Map keys for next and previous buffer
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })

-- Close the current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- Quit Neovim
vim.keymap.set('n', '<leader>q', ':qa<CR>')

-- Quit without saving 
vim.keymap.set('n', '<leader>qq', ':qa!<CR>')

-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Save and quit
vim.keymap.set('n', '<leader>wq', ':wqa<CR>')

-- Recent files
vim.keymap.set('n', 'leader>r', ':Telescope oldfiles')
