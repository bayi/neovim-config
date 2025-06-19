-- Set relative line numbers
vim.opt.relativenumber = true

-- Decrease swap file update time becasue power goes out often :D
vim.opt.updatetime = 50

-- Blade support
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
  extension = {
    blade = 'blade.php'
  }
})

-- make $ part of the keyword for php.
vim.api.nvim_exec2(
[[
autocmd FileType php set iskeyword+=$
]], {})

-- copilot
vim.keymap.set('i', '<C-r>', 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false})

vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = true

vim.g.copilot_settings = { selectedCompletionModel = 'gpt-4o-copilot' }

-- Set python3.11
-- let g:python_host_prog and let g:python3_host_prog
vim.g.python_host_prog = '/usr/bin/python3.11'
vim.g.python3_host_prog = '/usr/bin/python3.11'

