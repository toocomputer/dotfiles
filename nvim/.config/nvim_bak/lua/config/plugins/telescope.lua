return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        defaults = {
          layout_strategy = "vertical",
          initial_mode = "normal", 
          file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*"
          }
        },
        pickers = {
          find_files = {
            hidden = true
          }               
        }
      }
      vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep)
      vim.keymap.set("n", "<leader>fd", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
    end
  }
}
