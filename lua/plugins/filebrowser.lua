return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "NeoTree",
    opts = {
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = {
                enabled = true,
            },
            use_libuv_file_watcher = true,
            filtered_items = {
                hide_dotfiles = false,
                always_show = {
                    ".env",
                }
            }
        },
        window = {
            mappings = {
                ["<space>"] = "none",
            },
        },
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
        },
    },
    keys = {
        {
            "<C-e>",
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            desc = "File browser"
        },
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            desc = "File browser"
        }
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        vim.g.neo_tree_remove_legacy_commands = 1
        if vim.fn.argc() == 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("neo-tree")
            end
        end
    end,
}
