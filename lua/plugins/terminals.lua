return {
  {
    -- Terminals
    "akinsho/nvim-toggleterm.lua",
    version = "*",
    opts = {},
    config = function()
      require("toggleterm").setup()
    end
  },
}
