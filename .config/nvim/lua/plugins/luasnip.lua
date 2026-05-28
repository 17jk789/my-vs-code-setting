-- plugin/luasnip.lua

return {
  {
    "L3MON4D3/LuaSnip",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    config = function()
      local ls = require("luasnip")

      -- VSCode-like Standard Snippets (C, C++, Python, Rust, etc.)
      require("luasnip.loaders.from_vscode").lazy_load()

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("cpp", {
        s("class", {
          t("class "),
          i(1, "Name"),
          t({ " {", "public:", "    " }),
          i(2),
          t({ "", "private:", "    " }),
          i(3),
          t({ "", "};" }),
        }),
      })
    end,
  },
}
