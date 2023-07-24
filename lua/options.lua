-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamed'

-- Enable autowrite
vim.o.autowrite = true

-- Enable break indent
vim.o.breakindent = true

-- Enable autoindent
vim.o.autoindent = true

-- Save undo history
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight current line
vim.o.cursorline = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣', extends = '…', precedes = '…' }

-- Disable line wrapping
vim.opt.wrap = false

-- Hides quotes in jsons for example
vim.opt.conceallevel = 1

-- Disable auto commenting on newlines
-- vim.o.formatoptions = "jqln"
-- vim.opt_local.formatoptions:remove({'c', 'r', 'o'})
-- vim.cmd('autocmd BufEnter * set formatoptions-=cro')
-- vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
