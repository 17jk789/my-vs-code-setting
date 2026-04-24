-- config/options.lua

vim.opt.number = true
vim.opt.relativenumber = true
-- vim.cmd [[
--   augroup NumberToggle
--     autocmd!
--     autocmd InsertEnter * set norelativenumber
--     autocmd InsertLeave * set relativenumber
--   augroup END
-- ]]

-- vim.keymap.set("t", "<C-g>", [[>C-\><C-n>]], { noremap = true, silent = true})
vim.keymap.set("t", "<C-g>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 9

-- new
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 250

vim.opt.mouse = "a"
-- vim.opt.mouse = "nvi"

-- vim.opt.winbar = "%=%m %f  | %l/%L"

local function get_ls_style()
  local path = vim.fn.expand("%:p")
  if path == "" then
    return ""
  end

  -- Home kürzen zu ~
  local home = vim.fn.expand("$HOME")
  local rel_path = path:gsub("^" .. vim.pesc(home), "~")

  -- File stats
  local stat = vim.uv.fs_stat(path)
  if not stat then
    return rel_path
  end

  local perms = vim.fn.getfperm(path)
  local size = stat.size

  local mtime = os.date("%b %d %H:%M", stat.mtime.sec)

  -- local file = vim.fn.fnamemodify(path, ":t")

  -- local text = table.concat({
  --   -- " " .. rel_path,
  --   rel_path,
  --   "󰌾 " .. perms,
  --   "󰈔 " .. size .. "B",
  --   " " .. mtime,
  --   -- "󰈙 " .. file,
  -- }, " › ")

  local text = table.concat({
    -- " " .. rel_path,
    rel_path,
    perms,
    size .. "B",
    mtime,
    -- "󰈙 " .. file,
  }, " › ")

  -- limit 80% window width
  local winwidth = vim.fn.winwidth(0)
  local maxlen = math.floor(winwidth * 0.8)

  if vim.fn.strdisplaywidth(text) > maxlen then
    text = vim.fn.strcharpart(text, 0, maxlen - 1) .. "…"
  end

  return "%=%m " .. text
end

_G.winbar = get_ls_style
vim.opt.winbar = "%!v:lua.winbar()"

-- vim.filetype.add({
--   extension = {
--     fxml = "xml",
--   },
-- })

-- Mason-Binaries zum System-Pfad hinzufügen (behebt "CLI not found")
vim.env.PATH = vim.fn.expand("$HOME/.local/share/nvim/mason/bin:") .. vim.env.PATH

-- In lua/config/options.lua ganz unten:
vim.opt.rtp:prepend("/home/jk/.local/share/nvim/site")

-- In lua/config/options.lua (ganz oben)
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Beruhigt den Snacks-Healthcheck
vim.api.nvim_set_hl(0, "SnacksNormal", { fg = "#cba6f7", bg = "NONE" })
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#585b70", bg = "NONE" })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
    source = "if_many",
  },
  float = {
    border = "rounded",
  },
  severity_sort = true,
})

-- vim.opt.guicursor = "n-v-c:block,i:block-blinkwait500-blinkon500-blinkoff500"
