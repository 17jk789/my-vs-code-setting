-- lsp/docker.lua

local M = {}

-- Registriert den Autocommand für Dockerfiles
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dockerfile",
    callback = function()
        local lspconfig = require('lspconfig')

        -- Standard-Capabilities vorbereiten
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local status_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
        if status_cmp then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- Hilfsfunktion für Keymaps (falls du bufferspezifische Keys brauchst)
                local buf_map = function(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, lhs, rhs, opts)
                end
            end,
        })
    end,
})

return M
