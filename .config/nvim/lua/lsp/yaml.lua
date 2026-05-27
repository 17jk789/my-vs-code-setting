-- lsp/yaml.lua

local M = {}

-- Wir verpacken das Setup in einen Autocommand für den Filetype 'yaml'
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        -- Falls der Server für diesen Buffer schon läuft, brechen wir ab
        local lspconfig = require('lspconfig')
        
        -- Standard-Capabilities für Autovervollständigung holen
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local status_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
        if status_cmp then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        lspconfig.yamlls.setup({
            capabilities = capabilities,
            settings = {
                yaml = {
                    -- Korrigierte URL: Das offizielle Compose-Spec Schema für fehlerfreie Autovervollständigung
                    schemas = {
                        ["https://githubusercontent.com"] = "docker-compose*.y*ml",
                    },
                },
            },
            on_attach = function(client, bufnr)
                local buf_map = function(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, lhs, rhs, opts)
                end
                -- Hier kannst du bei Bedarf spezifische YAML-Keymaps eintragen
            end,
        })
    end,
})

return M
