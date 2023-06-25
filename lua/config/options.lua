-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable python provider
vim.g.loaded_python3_provider = 0
-- Disable perl provider
vim.g.loaded_perl_provider = 0

-- Indentation
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Clipboard
vim.o.clipboard = "unnamed"

-- Formatting
vim.o.formatoptions = "jqln"
