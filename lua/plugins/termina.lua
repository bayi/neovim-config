return {
    {
        "rebelot/terminal.nvim",
        config = function(_, opts)
            local term = require("terminal")
            term.setup(opts)

            local termmap = require("terminal.mappings")
            vim.keymap.set("n", "<leader>to", termmap.open, { desc = "Open terminal" })
            vim.keymap.set("n", "<leader>tr", termmap.run, { desc = "Run command" })
            vim.keymap.set("n", "<leader>tk", termmap.kill, { desc = "Kill terminal" })
        end
    }


}
