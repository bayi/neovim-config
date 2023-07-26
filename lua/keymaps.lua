-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>xe', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Move selected blocks of code
vim.keymap.set('v', 'K', ':move \'<-2<CR>gv=gv', { desc = 'Move block of code up' })
vim.keymap.set('v', '<S-Up>', ':move \'<-2<CR>gv=gv', { desc = 'Move block of code up' })
vim.keymap.set('v', 'J', ':move \'>+1<CR>gv=gv', { desc = 'Move block of code down' })
vim.keymap.set('v', '<S-Down>', ':move \'>+1<CR>gv=gv', { desc = 'Move block of code down' })
