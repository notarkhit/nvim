return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,

	opts = {
		style = "night",
		transparent = true,

		on_colors = function(_) end,

		on_highlights = function(hl, _)
			hl.Comment = { fg = "#979baf" }
		end,
	},

	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight-night")
		vim.cmd.hi("Comment gui=none")
	end,
}
