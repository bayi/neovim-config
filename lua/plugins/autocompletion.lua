return {
    -- Autocompletion
    -- See `:help cmp`
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',

        -- Path
        'hrsh7th/cmp-path',

        -- Command line
        'hrsh7th/cmp-cmdline',

        -- Buffer
        'hrsh7th/cmp-buffer',

        -- Copilot
        {
            'zbirenbaum/copilot-cmp',
            config = function()
                require('copilot_cmp').setup()
            end
        },

        -- tailwind
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },

        -- icons
        'onsails/lspkind.nvim'
    },
    opts = function(_, opts)
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        local lspkind = require('lspkind')
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = {
                { name = 'copilot',  group_index = 2 },
                { name = 'nvim_lsp', group_index = 2 },
                { name = 'buffer',   group_index = 2 },
                { name = 'path',     group_index = 2 },
                { name = 'luasnip',  group_index = 2 },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    symbol_map = { Copilot = "" },
                    before = function(entry, item)
                        -- Tailwind colorizer
                        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
                    end
                })
            }
        }
    end
}
