-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>cr', vim.lsp.buf.rename, 'Rename Symbol')
    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
    nmap('<leader>cd', vim.diagnostic.open_float, "Line Diagnostics")
    nmap('<leader>cl', "<cmd>LspInfo<cr>",  "Info")

    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
    nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
    nmap('<leader>cD', vim.lsp.buf.type_definition, 'Type Definition')
    nmap('<leader>cb', "<C-o>", "Go back")
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- gopls = {},      -- go
    -- rust_analyzer = {}, -- rust
    lua_ls = { -- lua
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}
local is_npm = vim.fn.executable('npm') == 1
local is_gcc = vim.fn.executable('gcc') == 1
local is_php = vim.fn.executable('php') == 1
-- local is_python = vim.fn.executable('python') == 1
local is_docker = vim.fn.executable('docker') == 1

if is_npm then
    servers.tsserver = {}     -- typesecript/javascript
    servers.volar = {}        -- vue
    servers.tailwindcss = {}  -- tailwind
    servers.html = {}         -- html
    servers.eslint = {}       -- eslint
end

if is_php and is_npm then
    servers.intelephense = {
        settings = {
            intelephense = {
                stubs = {
                    "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dba", "dom",
                    "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv",
                    "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl",
                    "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell",
                    "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL",
                    "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
                    "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib", "mcrypt", "redis", "swoole",
                },
            },
        },
    } -- php
end

if is_gcc then
    servers.clangd = {} -- c/c++
end

-- if is_python then
--     servers.jedi_language_server = {} -- python
-- end

if is_docker and is_npm then
    servers.dockerls = {}                        -- docker
    servers.docker_compose_language_service = {} -- docker-compose
end

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        -- This fixes a bug with clangd
        if server_name == "clangd" then
            capabilities.offsetEncoding = { "utf-16" }
        end
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,

