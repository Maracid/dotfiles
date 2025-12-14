vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- n
map("n", "j", "h", opts)
map("n", "k", "j", opts)
map("n", "i", "k", opts)
map("n", "h", "i", opts)

map("n", "<leader>w", ":w<CR>",  opts)
map("n", "<leader>q", ":q!<CR>",  opts)
map("n", "<leader>x", ":wq<CR>", opts)

map("n", "I", "^", opts)
map("n", "K", "$", opts)
map("n", "J", "I", opts)
map("n", "L", "A", opts)

-- v
map("v", "j", "h", opts)
map("v", "k", "j", opts)
map("v", "i", "k", opts)
map("v", "h", "i", opts)

map("v", "<leader>k", ":m '>+1<CR>gv=gv", opts)
map("v", "<leader>i", ":m '<-2<CR>gv=gv", opts)

-- i
map("i", "jk", "<ESC>", opts)
