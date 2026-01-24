# My-neovim-setting

This repository contains my personal **Neovim settings**.

> ⚠️ **Important:**
> This repo was not created for public distribution.
> It is intended only for my own use, so I can use my settings on another computer without logging into my GitHub account.

---

## Disclaimer

These settings are provided **as-is**, without any warranty.

I am **not responsible** for any issues, errors, or damage that may occur from using them, including but not limited to:

* configuration problems
* loss of data
* software issues
* compatibility problems

Use them **at your own risk**.

---

## License

This repository is released under the **Apache License 2.0**.

---

## Notes

* Some settings may be system-specific (Windows vs Linux).
* This configuration is tailored to my personal workflow and may not suit everyone.

# 0)

Installiere Neovim: [Neovim](https://neovim.io/)

> **Hinweis:**  
> Lade das Archiv `nvim-linux-x86_64.tar.gz` manuell von der Neovim-Website herunter  
> und speichere es im Ordner `~/Downloads`, bevor du die folgenden Befehle ausführst.

```bash
sudo apt update
sudo apt install curl wget unzip build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install clang cmake ninja-build gdb
sudo apt install openjdk-21-jdk gradle maven
sudo apt install wl-clipboard
# sudo snap install languagetool
sudo apt install vim-common
sudo apt install hunspell-de-de hunspell-en-us
mkdir -p ~/.local/share/nvim/spell
cd ~/.local/share/nvim/spell
cp /usr/share/vim/vim*/spell/en.utf-8.spl ~/.local/share/nvim/spell/en_us.utf-8.spl
cp /usr/share/vim/vim*/spell/de.utf-8.spl ~/.local/share/nvim/spell/de_de.utf-8.spl
cd ~/Downloads
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
source ~/.bashrc
# required
# mv ~/.config/nvim{,.bak}
# optional but recommended
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
# Das Entfernen von .git ist Absicht, sonst hängt man am Starter-Repo.
rm -rf ~/.config/nvim/.git 
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
fc-cache -fv
nvim
```

# 1) Struktur 

```text
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── autocmds.lua
    └── plugins/
        ├── lsp.lua
        ├── completion.lua
        ├── dap.lua
        ├── rust.lua
        ├── cpp.lua
        ├── java.lua
        ├── mason.lua
        ├── github_theme.lua
        ├── ui.lua
        ├── treesitter.lua
        ├── markdown.lua
        └── ltex.lua
```

---

# 2) init.lua (keine Änderungen nötig)

LazyVim lädt automatisch alles aus `lua/config/` und `lua/plugins/`.

---

# 3) config/options.lua

```lua
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 250

vim.opt.mouse = "a"

```

---

# 4) config/keymaps.lua

```lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)
map("n", "<C-o>", ":Telescope lsp_document_symbols<CR>", opts)
map("n", "<C-m>", ":TroubleToggle<CR>", opts)
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

map("n", "<C-_>", "gcc", opts)
map("v", "<C-_>", "gc", opts)

map("n", "<C-S-p>", ":Telescope commands<CR>", opts)

map("n", "<C-Tab>", ":bnext<CR>", opts)
map("n", "<C-S-Tab>", ":bprevious<CR>", opts)

map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- map("n", "<C-m>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)

map("n", "<C-d>", "<cmd>lua require('dapui').toggle()<CR>", opts)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)

-- Clipboard yanking (system clipboard)
-- vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set({ "n", "o" }, "yy", '"+yy', { noremap = true, silent = true })
```

---

# 5) plugins/lsp.lua (einmalig + sauber + rust-analyzer + clangd)

```lua
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" }, -- slow
--               -- checkOnSave = { command = "check" } -- faster
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },
--       },
--     },
--   },
-- }

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
          },
        },
      },
    },
  },
}

```

---

# 6) plugins/completion.lua (sicher + stabil)

```lua
-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.mapping = cmp.mapping.preset.insert({
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })

--       opts.experimental = { ghost_text = false }
--     end,
--   },
-- }

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
      })

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.experimental = { ghost_text = false }
    end,
  },
}

```

---

# 7) plugins/rust.lua (Rust IDE + DAP + Crates)

Wichtig: **Keine doppelte rust-analyzer Konfiguration** — das macht nur LSPConfig.

```lua
-- return {
--  {
--    "Saecki/crates.nvim",
--    ft = { "rust", "toml" },
--    config = function()
--      require("crates").setup()
--    end,
--  },
-- }

return {
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      return {
        server = {
          on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
            vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
            vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
            vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
              inlayHints = {
                enable = true,
                typeHints = true,
                parameterHints = true,
                lifetimeElisionHints = "always",
              },
            },
          },
        },
      }
    end,
  },

  {
    "Saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup()
    end,
  },
}

```

---

# 8) plugins/cpp.lua (nur extras, LSP in lsp.lua)

```lua
-- return {
--   {
--     "p00f/clangd_extensions.nvim",
--     ft = { "c", "cpp", "objc", "objcpp" },
--     opts = {
--       server = {
--         cmd = {
--           "clangd",
--           "--background-index",
--           "--clang-tidy",
--           "--completion-style=detailed",
--           "--header-insertion=never",
--         },
--       },
--     },
--   },
-- }

return {
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    opts = {
      -- Keine eigene clangd Konfiguration hier!
      -- clangd kommt sauber aus lsp.lua (mason-lspconfig).
      server = {},
    },
  },
}

```

---

# 9) plugins/java.lua (Basis + stabil)

```lua
return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local jdtls = require("jdtls")
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local jdtls_path = mason_path .. "/packages/jdtls"

      local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_dir = jdtls_path .. "/config_linux"

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", jar,
          "-configuration", config_dir,
          "-data", vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
      }

      jdtls.start_or_attach(config)
    end,
  },
}

```

---

# 10) plugins/dap.lua (codelldb + Rust/C++ Debug)

```lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
      },
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local codelldb_path =
        mason_path .. "/packages/codelldb/extension/adapter/codelldb"

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Debug",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/target/debug/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.cpp = {
        {
          name = "Debug",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/build/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp
    end,
  },
}

```


```lua
-- lua/config/autocmds.lua
-- Rust: format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rs",
--   callback = function()
--     vim.lsp.buf.format({
--       async = false,
--       filter = function(client)
--         return client.name == "rust_analyzer"
--       end,
--     })
--   end,
-- })

-- Rust format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({
      async = false,
      filter = function(client)
        return client.name == "rust_analyzer"
      end,
    })
  end,
})

-- Always end file with newline
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local lastline = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]
    if lastline ~= "" then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "c", "cpp", "java", "lua" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "de_de", "en_us" }
  end,
})

```

```lua
-- in irgendeiner Datei, z.B. lua/plugins/mason.lua

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "codelldb",
        "jdtls",
      },
    },
  },
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = { "Git", "G" },
  -- },
}

```

```lua
-- ~/.config/nvim/lua/plugins/github_theme.lua
return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_dark_dimmed")
    end
  },
}

```

```lua
-- lua/plugins/ui.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/trouble.nvim",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = { width = 30 },
      renderer = { group_empty = true },
    },
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  },
}

```

```lua
-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "rust", "cpp", "c", "java", "toml",
        "markdown", "markdown_inline",
      },
      highlight = { enable = true },
    },
  },
}

```

```lua
-- lua/plugins/markdown.lua
-- return {
--   {
--     "iamcco/markdown-preview.nvim",
--     ft = { "markdown" },
--     build = function()
--       vim.fn["mkdp#util#install"]()
--     end,
--     config = function()
--       vim.g.mkdp_auto_start = 0
--       vim.g.mkdp_refresh_slow = 1
--       vim.g.mkdp_theme = "dark"
--     end,
--   },
--   {
--     "preservim/vim-markdown",
--     ft = { "markdown" },
--     config = function()
--       vim.g.vim_markdown_folding_disabled = 1
--       vim.g.vim_markdown_conceal = 0
--     end,
--   },
-- }

```

```lua
-- lua/plugins/ltex.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              language = "en-US",
              -- language = "de-DE",
              additionalRules = {
                enablePickyRules = true,
              },
              checkFrequency = "save", -- nicht bei jedem Tastendruck
            },
          },
          filetypes = {
            -- Docs
            "markdown",
            "text",
            "tex",
            "gitcommit",
            "rust",
            "c",
            "cpp",
            "java",
            "lua",
          },
        },
      },
    },
  },
}

-- Sprache wechseln (on the fly):
-- :LtexSwitchLanguage de-DE
-- :LtexSwitchLanguage en-US

```
