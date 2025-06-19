local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"

local is_npm = vim.fn.executable('npm') == 1
local is_gcc = vim.fn.executable('gcc') == 1
local is_php = vim.fn.executable('php') == 1
-- local is_python = vim.fn.executable('python') == 1
local is_docker = vim.fn.executable('docker') == 1

-- local servers = {}

local servers = {}
if is_npm then
  servers.html = {}
--  servers.tsserver = { -- javascript, typescript
--    init_options = {
--      preferences = {
--        disableSuggestions = true,
--      }
--    }
--  }
  servers.volar = { -- vue
    init_options = {
      typescript = {
        tsdk = vim.fn.expand("~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib")
      },
      preferences = {
        disableSuggestions = true,
      }
    }

  }
  servers.tailwindcss = {} -- tailwindcss
end
if is_php then
  servers.intelephense = { -- php
    settings = {
      intelephense = {
        stubs = {
            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dba", "dom",
            "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv",
            "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl",
            "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell",
            "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL",
            "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
            "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib", "mcrypt", "redis", "swoole", "random"
        },
      },
    }
  }
end

if is_gcc then
  servers.clangd = {} -- c, c++
end

if is_docker and is_npm then
  servers.dockerls = {}                        -- docker
  servers.docker_compose_language_service = {} -- docker-compose
end

for lsp, cfg in pairs(servers) do
  if lsp == "clangd" then
    capabilities.offsetEncoding = { "utf-16" }
  end
  if lsp == "volar" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "typescript", "javascript", "vue" },
      settings = cfg.settings or {},
      init_options = cfg.init_options or {},
    }
  elseif lsp == "tailwindcss" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "css", "scss", "javascript", "typescript", "vue", "pug" },
      settings = cfg.settings or {},
      init_options = cfg.init_options or {},
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = cfg.settings or {},
      init_options = cfg.init_options or {},
    }
  end
end
