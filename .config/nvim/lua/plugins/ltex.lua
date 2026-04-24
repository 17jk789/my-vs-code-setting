-- plugins/ltex.lua

return {
  {
    "neovim/nvim-lspconfig",
    ft = { "tex", "markdown", "text", "gitcommit" },
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              language = "auto",
              additionalRules = {
                enablePickyRules = true,
              },
              checkFrequency = "save",

              -- diagnosticSeverity = "information",

              -- completionEnabled = false,

              -- Beide Wörterbücher aktiv:
              dictionary = {
                ["en-US"] = {},
                ["de-DE"] = {},
              },
              -- dictionary = {
              --   ["en-US"] = { "Neovim", "LazyVim" },
              --   ["de-DE"] = { "Neovim", "LazyVim" },
              -- },

              -- latex = {
              --   commands = {
              --     ["\\cite"] = "dummy",
              --     ["\\ref"] = "dummy",
              --   },
              -- },
            },
          },
          filetypes = {
            "tex",
            "markdown",
            "text",
            "gitcommit",
          },
        },
      },
    },
  },
}

-- Sprache wechseln (on the fly):
-- :LtexSwitchLanguage de-DE
-- :LtexSwitchLanguage en-US
