return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,        -- Set to true to show hidden files
            hide_dotfiles = false, -- Set to false to show dotfiles
            hide_gitignored = true,-- Keep this true to hide gitignored files
          },
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        }
      })

      vim.keymap.set('n', '<leader>t', ':Neotree filesystem toggle reveal right<CR>', { silent = true })
    end,
  },
}
