-- Core Neovim options
local opt = vim.opt

-- Leader key (MUST be set before lazy.nvim loads)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- UI
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 3
opt.scrolljump = 5

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

-- Behavior
opt.hidden = true
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 100
opt.timeoutlen = 300

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding (treesitter-based, Neovim 0.11+)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99

-- Whitespace display
opt.list = true
opt.listchars = { tab = "› ", trail = "•", extends = "#", nbsp = "." }

-- Disable built-in plugins for performance
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
