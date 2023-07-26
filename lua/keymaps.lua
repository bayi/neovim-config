-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>xe", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Move selected blocks of code
-- vim.keymap.set("v", "K", ":move \'<-2<CR>gv=gv", { desc = "Move block of code up" })
vim.keymap.set("v", "<S-Up>", ":move \'<-2<CR>gv=gv", { desc = "Move block of code up" })
-- vim.keymap.set("v", "J", ":move \'>+1<CR>gv=gv", { desc = "Move block of code down" })
vim.keymap.set("v", "<S-Down>", ":move \'>+1<CR>gv=gv", { desc = "Move block of code down" })

-- J leaves the cursor where it is
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Most important keymap EVAR
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Unmap Q
vim.keymap.set("n", "Q", "<Nop>", { desc = "Unmap Q" })

-- Replace current word under cursor
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word under cursor" })

-- Ctrl Left/Right decrease/increase window width Up/Down decrease/increase window height
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height" })
