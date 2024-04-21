--##Options##--
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.swapfile = false

--##Keyboard##--
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Normal Mode--
--#Leader Key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--#Window Navigation
keymap( "n", "<C-Left>", "<C-w>h", opts )
keymap( "n", "<C-Down>", "<C-w>j", opts )
keymap( "n", "<C-Up>", "<C-w>k", opts )
keymap( "n", "<C-Right>", "<C-w>l", opts )

--#Resize Windows
keymap( "n", "<S-Left>", ":vertical resize -2<CR>", opts )
keymap( "n", "<S-Right>", ":vertical resize +2<CR>", opts )
keymap( "n", "<C-Up>", ":resize +2<CR>", opts )
keymap( "n", "<C-Down>", ":resize -2<CR>", opts )

--#Undo/Redo
keymap( "n", "<leader>z", ":undo<cr>", opts )
keymap( "n", "<leader>y", ":redo<cr>", opts )

--Visual Mode--
keymap( "v", "<A-Up>", ":m .+1<CR>", opts )
keymap( "v", "<A-Down>", ":m .-1<CR>", opts )

--Tab Manipulation--
keymap( "n", "<C-c>", ":tabclose<CR>", opts )
--keymap( "i", "<C-c>", ":tabclose<CR>", opts )

--Explorer--
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
