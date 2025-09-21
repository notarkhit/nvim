return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"lua_ls",
					"clangd",
					"pyright",
					"bashls",
					"hyprls",
					"emmet_ls",
					"ts_ls",
					"cssls",
					"jdtls",
					"rust_analyzer",
				},
				automatic_installation = true,
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim",    opts = {} },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end
			map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			map("K", vim.lsp.buf.hover, "Hover Docs")
			map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})
	end,
}
