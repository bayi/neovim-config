return {
    -- Fuzzy Finder (files, lsp, etc)
    -- See `:help telescope` and `:help telescope.setup()`
    -- See `:help telescope.builtin`
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        branch = "0.1.x",
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>b,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        },
        init = function()
            vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles,
                { desc = 'Find recently opened files' })
            vim.keymap.set('n', '<leader>b<space>', require('telescope.builtin').buffers,
                { desc = 'Find existing buffers' })
            vim.keymap.set('n', '<leader>b/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = 'Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
            vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = 'Search Files' })
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
                { desc = 'Search current Word' })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
                { desc = 'Search Diagnostics' })
            vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status,
                { desc = 'Git Status' })
            vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits,
                { desc = 'Search Git Commits' })
            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')
        end,
    },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

}
