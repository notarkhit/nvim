return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		highlight = {
			enable = true, -- Enable syntax highlighting
			groups = {
				-- Example: Customize or disable specific highlights
				Heading = { link = "Title" },
				Code = { link = "Normal" },
				BlockQuote = { link = "Comment" },
				HorizontalRule = { link = "Comment" },
				Table = { link = "Normal" },
				-- Remove background highlight for normal text
				Normal = { bg = "NONE" },
			},
		},
	},
}
