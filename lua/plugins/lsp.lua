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
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim",    opts = {} }, -- optional status UI
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 🗝️ Common keymaps + behavior
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

		-- 📦 Servers with optional custom settings
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			},
			pyright = {},
			ts_ls = {},
			rust_analyzer = {},
			clangd = {},
			bashls = {},
			cssls = {},
			html = {},
			emmet_ls = {},
			jdtls = {},
			hyprls = {},
		}

		--  Setup all servers
		for name, opts in pairs(servers) do
			opts.capabilities = capabilities
			opts.on_attach = on_attach
			lspconfig[name].setup(opts)
		end
	end,
}
