return {
    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        -- stylua: ignore
        keys = {
            { "<leader>bl", "<Cmd>bnext<CR>",                                          desc = "Next buffer" },
            { "<leader>bh", "<Cmd>bprevious<CR>",                                      desc = "Prev buffer" },
            { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
        },
    },
}
