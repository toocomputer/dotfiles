require("config.keymap")
require("config.lazy")

-- Enable absolute line numbers for all windows
vim.o.number = true

-- Enable absolute line numbers for all windows
vim.o.relativenumber = true

-- Make Y work like yy in Neovim
vim.cmd([[ nnoremap Y yy]])

-- Control width of actual tab characters displayed
vim.opt.tabstop = 2

-- Control # of spaces inserted/deleted when editing with the Tab key
vim.opt.softtabstop = 2

-- Control indentation size for auto-indent commands
vim.opt.shiftwidth = 2

-- Convert tabs into spaces when Tab key pressed in insert mode
vim.opt.expandtab = true

-- Set line wrap length
vim.opt.textwidth = 80

-- Enable line wrapping
vim.opt.wrap = true

-- Set linebreak to only wrap on word boundaries
vim.opt.linebreak = true

-- Set CWD to the directory of the current file
vim.cmd(":cd %:p:h")

vim.g.netrw_banner = 0 -- Hide the Netrw banner on top
