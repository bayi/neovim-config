return {
    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = {
                marks = true,         -- shows a list of your marks on ' and `
                registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
            defaults = {
                mode = { "n", "v" },
                -- ["g"] = { name = "+goto" },
                -- ["gz"] = { name = "+surround" },
                -- ["]"] = { name = "+next" },
                -- ["["] = { name = "+prev" },
                -- ["<leader><tab>"] = { name = "+tabs" },
                -- ["<leader>b"] = { name = "+buffer" },
                -- ["<leader>c"] = { name = "+code" },
                -- ["<leader>d"] = { name = "+diagnostics" },
                -- ["<leader>f"] = { name = "+file/find" },
                -- ["<leader>g"] = { name = "+git" },
                -- ["<leader>gh"] = { name = "+hunks" },
                -- ["<leader>q"] = { name = "+quit/session" },
                -- ["<leader>s"] = { name = "+search" },
                -- ["<leader>u"] = { name = "+ui" },
                -- ["<leader>w"] = { name = "+windows" },
                -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
            },

        },
        config = function(_, opts)
            local wk = require("which-key")
            print("Registering which key defaults ...")
            wk.setup(opts)
            wk.register(opts.defaults)
            wk.register({
                b = { name = "+buffer", },
                f = { name = "+file", },
                c = { name = "+code", 
                    f = { "<cmd>Format<cr>", "Format code" },
                },
                s = { name = "+search", },
                x = { name = "+diagnostics", },

            }, { prefix = "<leader>" })
        end,
    },
}
