-- plugins/latex.lua

return {
  {
    "lervag/vimtex",
    ft = { "tex" },

    init = function()
      -- Compiler (TeX Live Standard)
      vim.g.vimtex_compiler_method = "latexmk"

      -- PDF Viewer (Linux Empfehlung)
      vim.g.vimtex_view_method = "zathura"

      -- Quickfix nicht automatisch aufspringen lassen
      vim.g.vimtex_quickfix_mode = 0

      -- Conceal deaktivieren (bessere Lesbarkeit)
      vim.g.tex_conceal = ""
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },
}
