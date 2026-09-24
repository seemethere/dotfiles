-- Global keymaps (non-plugin specific)
local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Window navigation (fallback when not in tmux)
map("n", "<C-h>", "<C-w>h", "Go to left window")
map("n", "<C-j>", "<C-w>j", "Go to lower window")
map("n", "<C-k>", "<C-w>k", "Go to upper window")
map("n", "<C-l>", "<C-w>l", "Go to right window")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", "Previous buffer")
map("n", "<S-l>", "<cmd>bnext<cr>", "Next buffer")

-- Resize splits with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>", "Increase window height")
map("n", "<C-Down>", "<cmd>resize -2<cr>", "Decrease window height")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease window width")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase window width")

-- Better indenting in visual mode
map("v", "<", "<gv", "Outdent and reselect")
map("v", ">", ">gv", "Indent and reselect")
map("v", "<Tab>", ">gv", "Indent and reselect")
map("v", "<S-Tab>", "<gv", "Outdent and reselect")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

-- Equalize splits
map("n", "<leader>=", "<C-w>=", "Equalize splits")

-- Horizontal scrolling
map("n", "zl", "zL", "Scroll window right")
map("n", "zh", "zH", "Scroll window left")
