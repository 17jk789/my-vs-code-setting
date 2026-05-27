-- plugins/conform.lua

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
    },

    -- format_on_save = {
    --   timeout_ms = 2000,
    -- },
  },
}
