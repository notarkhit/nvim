return {
  {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
	library = {
		{ path = "luvit-meta/library", words = { "vim%.uv" } },
	  },
	},
  },

  { "Bilal2453/luvit-meta", lazy = true },
  
  {
  --[[ Main lsp configuration ]]
	"neovim/nvim-lspconfig",
	dependencies = {
	  { "williamboman/mason.nvim", config = true },
	  "williamboman/mason-lspconfig.nvim",
	  "WhoIsSethDaniel/mason-tool-installer.nvim",
	  { "j-hui/fidget.nvim", opts = {} },
	  "hrsh7th/cmp-nvim-lsp",
	},
	config = function()
	end
  },
}
