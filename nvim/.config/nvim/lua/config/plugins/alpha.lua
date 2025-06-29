return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰈞 > Find file", ":cd $HOME/Projects | Telescope find_files<CR>"),
        dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button("q", " > Quit NVIM", ":qa<CR>"),
      }

      -- Set footer
      local lazy_stats = require("lazy").stats() -- Get Lazy.nvim stats
      dashboard.section.footer.val = {
        "First, solve the problem. Then write the code.",
        " ",
        "                                  - John Johnson",
        " ",
--        "             Plugins loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end,
  },
}

