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
					"air",
				},
				automatic_installation = true,
			},
		},
		{ "j-hui/fidget.nvim",    opts = {} },
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local on_attach = function(_, bufnr)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end

			map("gd", vim.lsp.buf.definition, "Goto Definition")
			map("K", vim.lsp.buf.hover, "Hover Docs")
			map("gr", vim.lsp.buf.references, "Goto References")
			map("<leader>rn", vim.lsp.buf.rename, "Rename")
			map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		end

		-- Global defaults (nightly API)
		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Lua specific tweaks
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		})

		vim.lsp.enable({
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
			"air",
		})
	end,
}
