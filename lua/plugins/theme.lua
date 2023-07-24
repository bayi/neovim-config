return {
    -- Theme inspired by Atom
    -- 'navarasu/onedark.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,

    -- {
    --     "folke/tokyonight.nvim",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme 'tokyonight-night'
    --     end,
    -- },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require 'nordic'.load()
    --     end
    -- },
    {
        'lunarvim/darkplus.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'darkplus'
        end,
    },
}
