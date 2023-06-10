-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-X>", ":Lazy<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-E>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>uu", ":Telescope undo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-T>", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-S>", ":w<CR>", { noremap = true, silent = true })
