vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.breakindent = true

-- case insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- Displays which key popup sooner
vim.opt.timeoutlen = 250

-- minimal number pf screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- configure how splits will be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- configure whitespace character handling
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live while typing
vim.opt.inccommand = "split"

-- configure tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- set clipboard

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline",
	},
	cache_enabled = 0,
}
