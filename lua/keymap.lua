vim.g.mapleader = " "
options = { noremap = true }

vim.keymap.set("i", "jk","<Esc>")
vim.keymap.set("i", "jj","<Esc>")

-- go back to file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.Ex)

-- go to left/right most position
vim.keymap.set("n", "H", "_")
vim.keymap.set("n", "L", "$")

-- lsp-related kemaps
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, options)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, options)
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", options)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, options)

-- move windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- move highlighted lines at a time
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without replacing yanked buffers
vim.keymap.set("x", "<leader>p", "\"_dP")

-- uank also to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})

