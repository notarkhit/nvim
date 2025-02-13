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
	}
  },

  config = function()
	vim.api.nvim_create_autocmd("LspAttach", {
	  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	  callback = function(event)
		local map = function(keys, func, desc, mode)
		  mode = mode or "n"
		  vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	  end
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	map(
		"<leader>ws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		"[W]orkspace [S]ymbols"
	)
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	}
  end

}
