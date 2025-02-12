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
