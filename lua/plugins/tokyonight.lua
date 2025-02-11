return {
  -- the colorscheme should be available when starting Neovim
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
	    require("tokyonight").setup({
		style =  "night",
		transparent = true
	    })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
      vim.cmd.hi("Comment gui=none")
    end,
  }
