-- Global keymaps (non-plugin specific)
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation (fallback when not in tmux)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)

-- Resize splits with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Better indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Equalize splits
keymap("n", "<leader>=", "<C-w>=", opts)

-- Horizontal scrolling
keymap("n", "zl", "zL", opts)
keymap("n", "zh", "zH", opts)
