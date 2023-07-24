return {
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            current_line_blame = true,
            numhl = true,
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gS', require('gitsigns').stage_buffer, { buffer = bufnr, desc = 'Stage buffer' })
                vim.keymap.set('n', '<leader>gU', require('gitsigns').undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage' })
                vim.keymap.set('n', '<leader>gC', "<cmd>term git commit<CR>", { buffer = bufnr, desc = 'Commit changes' })
                vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview' })
                -- vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                --     { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                -- vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                --     { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                -- vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                --     { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },
}
