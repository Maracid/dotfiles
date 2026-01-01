vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", "<leader>k", ":m '>+1<CR>gv=gv", opts)
map("v", "<leader>i", ":m '<-2<CR>gv=gv", opts)
