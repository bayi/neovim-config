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
        },
        config = function(_, opts)
            local wk = require("which-key")
            print("Registering which key defaults ...")
            wk.setup(opts)
            wk.register({
                ["?"] = { "<cmd>WhichKey<CR>", "Show keybindings" },
                b = { name = "+buffer", },
                c = {
                    name = "+code",
                    f = { "<cmd>Format<cr>", "Format code" },
                },
                f = { name = "+file", },
                g = { name = "+git", },
                s = { name = "+search", },
                x = { name = "+diagnostics", },

            }, { prefix = "<leader>" })
        end,
    },
}
