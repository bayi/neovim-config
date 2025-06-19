local plugins = {
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "plugins.configs.mason"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "json",
        "php",
        "vue",
        "pug",
        "markdown",

        -- Shell
        "bash",
        "yaml",

        -- Low level
        "c",
        "cpp",

        -- FPGA
        "verilog",

        -- Laravel
        "blade",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      ---@class ParserInfo[]
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
          install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
            files = {
              "src/parser.c",
              -- 'src/scanner.cc',
            },
            branch = "main",
            generate_requires_npm = true,
            requires_generate_from_grammar = true,
          },
          filetype = "blade",
      }
    end,
  },
  -- Nvimtree git support
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true, -- show git statuses
        ignore = false, -- still show .gitignore files
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            git = {
              deleted = "✗",
              unstaged = "",
            }
          }

        },
      },
    }
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      numhl = true,
    }
  },
  -- Copilot
--  {
--    "zbirenbaum/copilot.lua",
--    event = "InsertEnter",
--    opts = {
--      suggestion = {
--        enable = false,
--      },
--      panel = {
--        enable = false,
--      },
--      filetypes = {
--        markdown = true,
--      }
--    },
--  },
  {
    "github/copilot.vim",
--    lazy = false,
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
--    dependencies = {
--      {
--        "zbirenbaum/copilot-cmp",
--        config = function()
--          require("copilot_cmp").setup()
--        end,
--      },
--    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
--        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  { 'wakatime/vim-wakatime', lazy = false },
--  {
--    'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
--    -- Activate when a file is created/opened
--    event = { 'BufReadPre', 'BufNewFile' },
--    -- Activate when a supported filetype is open
--    ft = { 'go', 'javascript', 'python', 'ruby' },
--    cond = function()
--      -- Only activate if token is present in environment variable.
--      -- Remove this line to use the interactive workflow.
--      -- return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
--    end,
--    opts = {
--      statusline = {
--        -- Hook into the built-in statusline to indicate the status
--        -- of the GitLab Duo Code Suggestions integration
--        enabled = true,
--      },
--    },
--  }
}

return plugins
