return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")

		lspconfig.ts_ls.setup({
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_dir = function(fname)
				return util.find_git_ancestor(fname)
					or util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
					or vim.fn.getcwd()
			end,
			single_file_support = true,
		})
	end,
}
