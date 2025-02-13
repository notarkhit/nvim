return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
	{
	  "williamboman/mason.nvim",
	  config = true,
	},

	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{
	  "j-hui/fidget.nvim",
	  opts = {},
      tag = "legacy",
    },
	"hrsh7th/cmp-nvim-lsp",
  },

  config = function()

  end
}
