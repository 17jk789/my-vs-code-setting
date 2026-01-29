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

* Some settings may be system-specific (Windows vs Linux) -Y *Linux - Ubuntu 24.04.03 LTS*.
* This configuration is tailored to my personal workflow and may not suit everyone.

<details>
<summary>Links</summary>

- https://www.lazyvim.org/keymaps
- https://neovim.io/
- https://github.com/neovim/neovim
- https://www.lazyvim.org/
- https://github.com/LazyVim/LazyVim

</details>

# -1)

Installiere Neovim: [Neovim](https://neovim.io/)

> **Hinweis:**  
> Lade das Archiv `nvim-linux-x86_64.tar.gz` manuell von der Neovim-Website herunter  
> und speichere es im Ordner `~/Downloads`, bevor du die folgenden Befehle ausführst.

```bash
sudo apt update
sudo apt install curl wget unzip build-essential cmark
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install clang cmake ninja-build gdb
sudo apt install openjdk-21-jdk maven
sudo snap install gradle --classic
sudo apt install wl-clipboard fd-find tmux
sudo apt install python3-venv
sudo apt install alacritty # besser für Lazyvim als gnome-terminal oder konsole (KDE)
# sudo apt install kitty
# sudo apt install wezterm
# sudo apt install default-jre
# sudo snap install languagetool
# sudo apt install vim vim-common
# sudo apt install hunspell-de-de hunspell-en-us
# mkdir -p ~/.local/share/nvim/spell
# cd ~/.local/share/nvim/spell
# cp /usr/share/vim/vim*/spell/en.utf-8.spl ~/.local/share/nvim/spell/en_us.utf-8.spl
# cp /usr/share/vim/vim*/spell/de.utf-8.spl ~/.local/share/nvim/spell/de_de.utf-8.spl
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
# git clone --depth=1 https://github.com/github/copilot.vim.git \
# ~/.config/nvim/pack/github/start/copilot.vim
nvim
```

Update Neovim:

```bash
# 1) Alte Version prüfen
/opt/nvim/bin/nvim --version

# 2) Neue Version laden
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# 3) Entpacken
tar -xzf nvim-linux-x86_64.tar.gz

# 4) Backup der alten Version (wichtig!)
sudo mv /opt/nvim /opt/nvim.bak

# 5) Neue Version installieren
sudo mv nvim-linux-x86_64 /opt/nvim

# 6) Test
/opt/nvim/bin/nvim --version
```

Wenn alles OK:
```bash
sudo rm -rf /opt/nvim.bak
```
- 1) inits

Python:

```bash
mkdir mein_python_projekt
cd mein_python_projekt
python -m venv venv
source venv/bin/activate
touch main.py
pip install 'python-lsp-server[all]' black ruff debugpy
nvim .
```

oder:

```bash
vim ~/create-python-pro.sh
chmod +x create-python-pro.sh
~/create-python-pro.sh new mein-python-projekt
nvim .
```

create-python-pro.sh:

```bash
#!/bin/bash

# create-python-pro.sh

# Prüfen, ob der Benutzer ein Argument übergeben hat
if [ "$1" != "new" ] || [ -z "$2" ]; then
    echo "Usage: $0 new <projektname>"
    exit 1
fi

PROJECT_NAME=$2

# Projektordner erstellen und wechseln
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# Virtuelle Umgebung erstellen
python3 -m venv venv

# Virtuelle Umgebung aktivieren
# Hinweis: Dies funktioniert nur im Skript, wenn man 'source' im aktuellen Shell ausführt
# Für interaktive Nutzung: der Benutzer muss manuell aktivieren
echo "Aktiviere die virtuelle Umgebung mit: source venv/bin/activate"

# Hauptdatei erstellen
touch main.py

# Python-Tools installieren
# Aktiviert nur für diesen Befehl die venv automatisch
source venv/bin/activate
pip install --upgrade pip
pip install 'python-lsp-server[all]' black ruff debugpy
```

Rust:

```bash
cargo new mein_rust_projekt
cd mein_rust_projekt
nvim .
```

Java:

```bash
vim ~/create-java-pro.sh
chmod +x ~/create-java-pro.sh
~/create-java-pro.sh new my-java-project
cd ~/my-java-project
nvim .
```

crate-java-pro.sh:

```bash
#!/usr/bin/env bash

# crate-java-pro.sh

set -e

# usage: ./crate-java-pro.sh new my-java-project
COMMAND=$1
PROJECT_NAME=$2

if [[ "$COMMAND" != "new" ]] || [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

# Erstelle Projektordner
PROJECT_DIR="$HOME/$PROJECT_NAME"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo "📁 Projektverzeichnis erstellt: $PROJECT_DIR"

# Gradle Wrapper initialisieren (mit Java 21)
gradle init --type java-application --dsl groovy --project-name "$PROJECT_NAME" --package "$PROJECT_NAME"

# Standardstruktur (falls init nicht alles erstellt)
mkdir -p src/main/java
mkdir -p src/test/java

# Beispiel Main-Klasse
MAIN_CLASS_PATH="src/main/java/${PROJECT_NAME//-/.}/App.java"
mkdir -p "$(dirname "$MAIN_CLASS_PATH")"
cat > "$MAIN_CLASS_PATH" <<EOF
package ${PROJECT_NAME//-/.};

public class App {
    public static void main(String[] args) {
        System.out.println("Hello from $PROJECT_NAME!");
    }
}
EOF
echo "📄 Beispiel-Main-Klasse erstellt: $MAIN_CLASS_PATH"

# Gradle Build-Dateien checken / erstellen
if [ ! -f "build.gradle" ]; then
cat > build.gradle <<EOF
plugins {
    id 'java'
    id 'application'
}

group = '$PROJECT_NAME'
version = '1.0-SNAPSHOT'

sourceCompatibility = '21'
targetCompatibility = '21'

mainClass = '$PROJECT_NAME.App'

repositories {
    mavenCentral()
}

dependencies {
    testImplementation 'org.junit.jupiter:junit-jupiter:5.10.0'
}

test {
    useJUnitPlatform()
}
EOF
echo "📄 build.gradle erstellt"
fi

if [ ! -f "settings.gradle" ]; then
cat > settings.gradle <<EOF
rootProject.name = '$PROJECT_NAME'
EOF
echo "📄 settings.gradle erstellt"
fi

# Optional: Gradle Wrapper generieren
gradle wrapper --gradle-version 8.3

# LazyVim Hinweise
echo ""
echo "✅ Projekt '$PROJECT_NAME' erstellt!"
echo "🔹 Öffne Projekt mit LazyVim: nvim $PROJECT_DIR"
echo "🔹 Stelle sicher, dass Mason installiert ist und folgende Pakete installiert sind:"
echo "   - jdtls"
echo "   - java-debug-adapter"
echo "   - java-test"
echo "🔹 Beim ersten Öffnen startet jdtls automatisch. F5=Debug, F9=Breakpoint, <leader>dt=<Testklasse debuggen>, <leader>dn=<Testmethode debuggen>"

```

C++:

```bash
vim ~create-cpp-pro.sh
chmod +x ~/create-cpp-pro.sh
~/create-cpp-pro.sh new my-cpp-project
cd ~/my-cpp-project/build
cmake ..
cmake --build .
nvim .
```

create-cpp-pro.sh:

```bas
#!/usr/bin/env bash

# create-cpp-pro.sh

set -e

# Usage: ./create-cpp-pro.sh new <project-name>
COMMAND=$1
PROJECT_NAME=$2

if [[ "$COMMAND" != "new" ]] || [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 new <project-name>"
  exit 1
fi

PROJECT_DIR="$HOME/$PROJECT_NAME"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"
echo "📁 Projektverzeichnis erstellt: $PROJECT_DIR"

# ===========================
# C/C++ Projektstruktur
# ===========================
mkdir -p src include build
echo "📁 C/C++ Standardstruktur erstellt: src/, include/, build/"

# Beispiel main.cpp
cat > src/main.cpp <<EOF
#include <iostream>

int main() {
    std::cout << "Hello C++ from LazyVim!" << std::endl;
    return 0;
}
EOF
echo "📄 Beispiel main.cpp erstellt"

# CMakeLists.txt
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.16)
project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

add_executable(${PROJECT_NAME} src/main.cpp)
EOF
echo "📄 CMakeLists.txt erstellt"

# ===========================
# LazyVim / Mason Hinweise
# ===========================
echo ""
echo "✅ Fertig! Projekt '$PROJECT_NAME' ist bereit."
echo "🔹 Build: cd $PROJECT_DIR/build && cmake .. && cmake --build ."
echo "🔹 LazyVim: öffne $PROJECT_DIR mit nvim"
echo "🔹 Mason-Pakete installieren (falls noch nicht vorhanden):"
echo "     - clangd (C/C++ LSP)"
echo "     - codelldb (Debug Adapter)"
echo "🔹 Keymaps in LazyVim:"
echo "     F5 → Start Debug (aktuelles Executable)"
echo "     F9 → Toggle Breakpoints"

```


# 0) Alacritty

```bash
mkdir -p ~/.config/alacritty
vim ~/.config/alacritty/alacritty.toml
```

```toml
[window]
# decorations = "None"

# Standard-Transparenz (80%)
opacity = 0.91

[[keyboard.bindings]]
key = "M"
mods = "Control"
action = "ToggleMaximized"

[[keyboard.bindings]]
key = "M"
mods = "Control|Shift"
action = "ToggleFullscreen"

# Nightfox Alacritty Colors
## name: carbonfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/alacritty.toml

[colors.primary]
background = "#000000"
# background = "#161616"
foreground = "#f2f4f8"
dim_foreground = "#b6b8bb"
bright_foreground = "#f9fbff"

[colors.cursor]
text = "#f2f4f8"
cursor = "#25be6a"

[colors.vi_mode_cursor]
text = "#f2f4f8"
cursor = "#33b1ff"

[colors.search.matches]
foreground = "#f2f4f8"
background = "#525253"

[colors.search.focused_match]
foreground = "#f2f4f8"
background = "#3ddbd9"

[colors.footer_bar]
foreground = "#f2f4f8"
background = "#353535"

[colors.hints.start]
foreground = "#f2f4f8"
background = "#3ddbd9"

[colors.hints.end]
foreground = "#f2f4f8"
background = "#353535"

[colors.selection]
text = "#f2f4f8"
background = "#2a2a2a"
# background = "#52bdff"

[colors.normal]
black = "#282828"
red = "#ee5396"
green = "#25be6a"
yellow = "#08bdba"
blue = "#78a9ff"
magenta = "#be95ff"
cyan = "#33b1ff"
white = "#dfdfe0"

[colors.bright]
black = "#484848"
red = "#f16da6"
green = "#46c880"
yellow = "#2dc7c4"
blue = "#8cb6ff"
magenta = "#c8a5ff"
cyan = "#52bdff"
white = "#e4e4e5"

[colors.dim]
black = "#222222"
red = "#ca4780"
green = "#1fa25a"
yellow = "#07a19e"
blue = "#6690d9"
magenta = "#a27fd9"
cyan = "#2b96d9"
white = "#bebebe"

[[colors.indexed_colors]]
index = 16
color = "#3ddbd9"

[[colors.indexed_colors]]
index = 17
color = "#ff7eb6"

# Nightfox Alacritty Colors
## name: nightfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/alacritty.toml

# [colors.primary]
# background = "#192330"
# foreground = "#cdcecf"
# dim_foreground = "#aeafb0"
# bright_foreground = "#d6d6d7"

# [colors.cursor]
# text = "#cdcecf"
# cursor = "#aeafb0"

# [colors.vi_mode_cursor]
# text = "#cdcecf"
# cursor = "#63cdcf"

# [colors.search.matches]
# foreground = "#cdcecf"
# background = "#3c5372"

# [colors.search.focused_match]
# foreground = "#cdcecf"
# background = "#81b29a"

# [colors.footer_bar]
# foreground = "#cdcecf"
# background = "#29394f"

# [colors.hints.start]
# foreground = "#cdcecf"
# background = "#f4a261"

# [colors.hints.end]
# foreground = "#cdcecf"
# background = "#29394f"

# [colors.selection]
# text = "#cdcecf"
# background = "#2b3b51"

# [colors.normal]
# black = "#393b44"
# red = "#c94f6d"
# green = "#81b29a"
# yellow = "#dbc074"
# blue = "#719cd6"
# magenta = "#9d79d6"
# cyan = "#63cdcf"
# white = "#dfdfe0"

# [colors.bright]
# black = "#575860"
# red = "#d16983"
# green = "#8ebaa4"
# yellow = "#e0c989"
# blue = "#86abdc"
# magenta = "#baa1e2"
# cyan = "#7ad5d6"
# white = "#e4e4e5"

# [colors.dim]
# black = "#30323a"
# red = "#ab435d"
# green = "#6e9783"
# yellow = "#baa363"
# blue = "#6085b6"
# magenta = "#8567b6"
# cyan = "#54aeb0"
# white = "#bebebe"

# [[colors.indexed_colors]]
# index = 16
# color = "#f4a261"

# [[colors.indexed_colors]]
# index = 17
# color = "#d67ad2"

# Nightfox Alacritty Colors
## name: carbonfox
## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/alacritty.toml

# [colors.primary]
# background = "#161616"
# foreground = "#f2f4f8"
# dim_foreground = "#b6b8bb"
# bright_foreground = "#f9fbff"

# [colors.cursor]
# text = "#f2f4f8"
# cursor = "#b6b8bb"

# [colors.vi_mode_cursor]
# text = "#f2f4f8"
# cursor = "#33b1ff"

# [colors.search.matches]
# foreground = "#f2f4f8"
# background = "#525253"

# [colors.search.focused_match]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.footer_bar]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.hints.start]
# foreground = "#f2f4f8"
# background = "#3ddbd9"

# [colors.hints.end]
# foreground = "#f2f4f8"
# background = "#353535"

# [colors.selection]
# text = "#f2f4f8"
# background = "#2a2a2a"

# [colors.normal]
# black = "#282828"
# red = "#ee5396"
# green = "#25be6a"
# yellow = "#08bdba"
# blue = "#78a9ff"
# magenta = "#be95ff"
# cyan = "#33b1ff"
# white = "#dfdfe0"

# [colors.bright]
# black = "#484848"
# red = "#f16da6"
# green = "#46c880"
# yellow = "#2dc7c4"
# blue = "#8cb6ff"
# magenta = "#c8a5ff"
# cyan = "#52bdff"
# white = "#e4e4e5"

# [colors.dim]
# black = "#222222"
# red = "#ca4780"
# green = "#1fa25a"
# yellow = "#07a19e"
# blue = "#6690d9"
# magenta = "#a27fd9"
# cyan = "#2b96d9"
# white = "#bebebe"

# [[colors.indexed_colors]]
# index = 16
# color = "#3ddbd9"

# [[colors.indexed_colors]]
# index = 17
# color = "#ff7eb6"

```

## oh-my-posh – würde ich nicht wirklich empfehlen, aber cool!

```bash
# curl -s https://ohmyposh.dev/install.sh | bash -s && \
# mkdir -p ~/.poshthemes && \
# oh-my-posh get theme illusi0n --output ~/.poshthemes/illusi0n.omp.json && \
# grep -qxF 'eval "$(oh-my-posh init bash --config ~/.poshthemes/illusi0n.omp.json)"' ~/.bashrc || echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/illusi0n.omp.json)"' >> ~/.bashrc && \
# source ~/.bashrc
```

# 1) Struktur 

```text
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   ├── lazyvim.lua
    │   └── autocmds.lua
    └── plugins/
        ├── lsp.lua
        ├── completion.lua
        ├── dap.lua
        ├── rust.lua
        ├── cpp.lua
        ├── java.lua
        ├── mason.lua
        ├── github_theme.lua // or nightfox
        ├── nightfox.lua.lua // or github_theme
        ├── ui.lua
        ├── treesitter.lua
        ├── markdown.lua
        ├── ltex.lua
        ├── git.lua
        ├── notify.lua
        └── dash.lua
```

---

# 2) init.lua (keine Änderungen nötig)

LazyVim lädt automatisch alles aus `lua/config/` und `lua/plugins/`.

---

# 3) config/options.lua

```lua
-- config/options.lua

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
-- config/keymaps.lua

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

-- d / dd NICHT ins Clipboard (Black-hole register)
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })

```

---

# 5) plugins/lsp.lua (einmalig + sauber + rust-analyzer + clangd)

```lua
-- plugins/lsp.lua

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

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
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

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         clangd = {
--           cmd = {
--             "clangd",
--             "--background-index",
--             "--clang-tidy",
--             "--completion-style=detailed",
--             "--header-insertion=never",
--           },
--         },

--         rust_analyzer = {
--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = {
--                   "unresolved-proc-macro",
--                   "unlinked-file",
--                 },
--               },

--               cargo = {
--                 allFeatures = true,
--                 buildScripts = { enable = true },
--               },

--               procMacro = { enable = true },
--               lens = { enable = true },

--               completion = {
--                 autoimport = { enable = true },
--               },

--               checkOnSave = {
--                 command = "clippy",
--               },

--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--                 closureReturnTypeHints = { enable = "always" },
--                 bindingModeHints = { enable = true },
--               },

--               files = {
--                 watcher = "client",
--               },
--             },
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

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                disabled = {
                  "unresolved-proc-macro",
                  "unlinked-file",
                },
              },

              cargo = {
                allFeatures = true,
                buildScripts = { enable = true },
              },

              procMacro = { enable = true },
              lens = { enable = true },

              completion = {
                autoimport = { enable = true },
              },

              checkOnSave = {
                command = "clippy",
              },

              inlayHints = {
                enable = true,
                typeHints = true,
                parameterHints = true,
                lifetimeElisionHints = "always",
                closureReturnTypeHints = { enable = "always" },
                bindingModeHints = { enable = true },
              },

              files = {
                watcher = "client",
              },
            },
          },
        },

        local jdtls = require('jdtls')

        jdtls.start_or_attach({
          cmd = {'jdtls'},  -- Pfad zu jdtls, evtl. '/usr/local/bin/jdtls'
          root_dir = require('jdtls.setup').find_root({'.git', 'pom.xml', 'build.gradle'}),
          settings = {
            java = {
              signatureHelp = { enabled = true },
              contentProvider = { preferred = 'fernflower' }
            }
          }
        })
      },
    },
  },
}

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
--               checkOnSave = { command = "check" },
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

-- return {
--   {
--    "neovim/nvim-lspconfig",
--    dependencies = {
--      "mason-org/mason.nvim",
--      "mason-org/mason-lspconfig.nvim",
--     },
--     opts = {
--       servers = {
--         rust_analyzer = {
--           root_dir = function(fname)
--             return require("lspconfig.util")
--               .root_pattern("Cargo.toml", ".git")(fname)
--               or vim.fn.getcwd()
--           end,
-- 
--           -- on_attach sorgt dafür, dass Shortcuts nur in Rust aktiviert sind
--           on_attach = function(_, bufnr)
--             local map = vim.keymap.set
--             local opts = { noremap = true, silent = true, buffer = bufnr }
-- 
--             -- Cargo Shortcuts
--             map("n", "<leader>rr", function()
--               vim.cmd("split | terminal cargo run")
--             end, opts)
-- 
--             map("n", "<leader>rd", function()
--               vim.cmd("split | terminal cargo debug")
--             end, opts)
-- 
--             map("n", "<leader>rb", function()
--               vim.cmd("split | terminal cargo build")
--             end, opts)
-- 
--             map("n", "<leader>rt", function()
--               vim.cmd("split | terminal cargo test")
--             end, opts)
-- 
--             map("n", "<leader>rc", function()
--               vim.cmd("edit Cargo.toml")
--             end, opts)
-- 
--             -- LSP Commands
--             map("n", "<leader>rh", function()
--               vim.lsp.buf.hover()
--             end, opts)
-- 
--             map("n", "<leader>re", function()
--               vim.lsp.buf.execute_command({
--                 command = "rust-analyzer.expandMacro",
--                 arguments = { vim.uri_from_bufnr(bufnr) },
--               })
--             end, opts)
-- 
--             map("n", "<leader>rf", function()
--               vim.lsp.buf.format({ async = true })
--             end, opts)
--           end,
-- 
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
-- 
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

```

---

# 6) plugins/completion.lua (sicher + stabil)

```lua
-- plugins/completion.lua

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

-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-nvim-lsp",
--       "L3MON4D3/LuaSnip",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")

--       opts.sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--       })

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
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- safer

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

      -- Ghost text ist nice, aber manchmal störend.
      opts.experimental = { ghost_text = false }
    end,
  },
}

```

---

# 7) plugins/rust.lua (Rust IDE + DAP + Crates)

Wichtig: **Keine doppelte rust-analyzer Konfiguration** — das macht nur LSPConfig.

```lua
-- plugins/rust.lua

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- alt!!!
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }
--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)
--           end,
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- This repository was archived by the owner on Jan 3, 2024. It is now read-only. 
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }

--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rb", ":split | terminal cargo build<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)

--             -- Auto Reload: Rust Analyzer neu laden wenn neue Datei erstellt wird
--             -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
--             --   pattern = { "*.rs", "Cargo.toml" },
--             --   callback = function()
--             --     -- nur wenn rust-tools aktiv ist
--             --     local ok, _ = pcall(vim.cmd, "RustReloadWorkspace")
--             --     if not ok then
--             --       -- fallback: LSP Restart
--             --       pcall(vim.cmd, "LspRestart")
--             --     end
--             --   end,
--             -- })
--           end,

--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = { "unresolved-proc-macro", "unlinked-file" },
--               },
--               cargo = { allFeatures = true },
--               checkOnSave = { command = "clippy" },
--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--               },
--             },
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "simrat39/rust-tools.nvim", -- This repository was archived by the owner on Jan 3, 2024. It is now read-only. 
--     ft = { "rust" },
--     dependencies = {
--       "neovim/nvim-lspconfig",
--       "nvim-lua/plenary.nvim",
--     },
--     opts = function()
--       return {
--         server = {
--           on_attach = function(_, bufnr)
--             local opts = { noremap = true, silent = true, buffer = bufnr }

--             vim.keymap.set("n", "<Leader>rr", ":split | terminal cargo run<CR>", opts)
--             vim.keymap.set("n", "<Leader>rd", ":split | terminal cargo debug<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rb", ":split | terminal cargo build<CR>i", opts)
--             vim.keymap.set("n", "<Leader>rh", "<cmd>RustHoverActions<CR>", opts)
--             vim.keymap.set("n", "<Leader>rc", "<cmd>RustOpenCargo<CR>", opts)

--             -- Auto Reload: Rust Analyzer neu laden wenn neue Datei erstellt wird
--             -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
--             --   pattern = { "*.rs", "Cargo.toml" },
--             --   callback = function()
--             --     -- nur wenn rust-tools aktiv ist
--             --     local ok, _ = pcall(vim.cmd, "RustReloadWorkspace")
--             --     if not ok then
--             --       -- fallback: LSP Restart
--             --       pcall(vim.cmd, "LspRestart")
--             --     end
--             --   end,
--             -- })
--           end,

--           settings = {
--             ["rust-analyzer"] = {
--               diagnostics = {
--                 disabled = {
--                   "unresolved-proc-macro",
--                   "unlinked-file",
--                 },
--                 experimental = {
--                   enable = true,
--                 },
--               },

--               cargo = {
--                 allFeatures = true,
--                 buildScripts = {
--                   enable = true,
--                 },
--               },

--               procMacro = {
--                 enable = true,
--               },

--               lens = {
--                 enable = true,
--               },

--               completion = {
--                 autoimport = {
--                   enable = true,
--                 },
--               },

--               checkOnSave = {
--                 command = "clippy",
--               },

--               inlayHints = {
--                 enable = true,
--                 typeHints = true,
--                 parameterHints = true,
--                 lifetimeElisionHints = "always",
--                 closureReturnTypeHints = {
--                   enable = "always",
--                 },
--                 bindingModeHints = {
--                   enable = true,
--                 },
--               },

--               files = {
--                 watcher = "client",
--               },
--             }
--           },
--         },
--       }
--     end,
--   },

--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup()
--     end,
--   },
-- }

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "rust", "toml" },
--     config = function()
--       require("crates").setup({
--         completion = {
--           cmp = { enabled = true },
--         },
--         popup = {
--           border = "rounded",
--         },
--       })
--     end,
--   },
-- }

-- return {
--   {
--     "Saecki/crates.nvim",
--     ft = { "toml" },
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "hrsh7th/nvim-cmp",
--     },
--     config = function()
--       local ok, crates = pcall(require, "crates")
--       if not ok then
--         return
--       end

--       crates.setup({
--         completion = {
--           cmp = { enabled = true },
--         },
--         popup = {
--           border = "rounded",
--         },
--       })
--     end,
--   },
-- }

return {
  {
    "Saecki/crates.nvim",
    ft = { "toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("crates").setup({
        popup = {
          border = "rounded",
        },
      })
    end,
  },
}

```

---

# 8) plugins/cpp.lua (nur extras, LSP in lsp.lua)

```lua
-- plugins/cpp.lua

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
-- plugins/java.lua

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local jdtls = require("jdtls")
--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local jdtls_path = mason_path .. "/packages/jdtls"

--       local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--       local config_dir = jdtls_path .. "/config_linux"

--       local config = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xms1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens", "java.base/java.util=ALL-UNNAMED",
--           "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--           "-jar", jar,
--           "-configuration", config_dir,
--           "-data", vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
--         },
--         root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
--       }

--       jdtls.start_or_attach(config)
--     end,
--   },
-- }

-- Wenn jar leer ist, startet LSP nicht!
-- root_dir kann nil sein
-- jdtls braucht Java 17+ (je nach Version).

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local jdtls = require("jdtls")
--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local jdtls_path = mason_path .. "/packages/jdtls"

--       local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--       if jar == "" then
--         vim.notify("jdtls jar not found. Install jdtls via Mason.", vim.log.levels.ERROR)
--         return
--       end

--       -- config dir abhängig vom OS
--       local os_config
--       if vim.fn.has("macunix") == 1 then
--         os_config = "config_mac"
--       elseif vim.fn.has("win32") == 1 then
--         os_config = "config_win"
--       else
--         os_config = "config_linux"
--       end

--       local config_dir = jdtls_path .. "/" .. os_config

--       -- root_dir berechnen
--       local root_dir = require("jdtls.setup").find_root({
--         ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
--       })

--       if not root_dir then
--         root_dir = vim.fn.getcwd()
--       end

--       -- Workspace eindeutig (hash des Pfades)
--       local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

--       local config = {
--         cmd = {
--           "java",
--           "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--           "-Dosgi.bundles.defaultStartLevel=4",
--           "-Declipse.product=org.eclipse.jdt.ls.core.product",
--           "-Dlog.protocol=true",
--           "-Dlog.level=ALL",
--           "-Xms1g",
--           "--add-modules=ALL-SYSTEM",
--           "--add-opens", "java.base/java.util=ALL-UNNAMED",
--           "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--           "-jar", jar,
--           "-configuration", config_dir,
--           "-data", workspace_dir,
--         },
--         root_dir = root_dir,
--         settings = {
--           java = {
--             eclipse = { downloadSources = true },
--             maven = { downloadSources = true },
--             format = { enabled = true },
--             referencesCodeLens = { enabled = true },
--             implementationsCodeLens = { enabled = true },
--           },
--         },
--       }

--       jdtls.start_or_attach(config)
--     end,
--   },
-- }

return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node

      ls.add_snippets("java", {

        s("mainclass", {
          t("public class "),
          f(function()
            return vim.fn.expand("%:t:r")
          end),
          t({ " {", "", "    public static void main(String[] args) {", "        " }),
          i(0),
          t({ "", "    }", "}", "" }),
        }),

        s("mc", {
          t("public class "),
          f(function()
            return vim.fn.expand("%:t:r")
          end),
          t({ " {", "", "    public static void main(String[] args) {", "        " }),
          i(0),
          t({ "", "    }", "}", "" }),
        }),

        s("mch", {
          t("public class "),
          f(function()
            return vim.fn.expand("%:t:r")
          end),
          t({
            " {",
            "",
            "    public static void main(String[] args) {",
            '        System.out.println("Hello World!");',
            "        ",
          }),
          i(0),
          t({ "", "    }", "}", "" }),
        }),

        s("pri", {
          t("System.out.print("),
          i(0),
          t(");"),
        }),

        s("priln", {
          t("System.out.println("),
          i(0),
          t(");"),
        }),
      })

      return opts
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local jdtls = require("jdtls")

      -- Pfad zu Mason
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local jdtls_path = mason_path .. "/packages/jdtls"

      local jar_files = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", true, true)
      local jar = jar_files[1]
      if not jar or jar == "" then
        vim.notify("JDTLS jar nicht gefunden. Bitte über Mason installieren.", vim.log.levels.ERROR)
        return
      end

      local os_config
      if vim.fn.has("macunix") == 1 then
        os_config = "config_mac"
      elseif vim.fn.has("win32") == 1 then
        os_config = "config_win"
      else
        os_config = "config_linux"
      end

      local config_dir = jdtls_path .. "/" .. os_config

      local root_dir = require("jdtls.setup").find_root({
        ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
      }) or vim.fn.getcwd()

      local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      end

      -- JDTLS Config
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
          "-data", workspace_dir,
        },
        root_dir = root_dir,
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            format = { enabled = true },
            referencesCodeLens = { enabled = true },
            implementationsCodeLens = { enabled = true },
          },
        },
      }

      jdtls.start_or_attach(config)
      
      jdtls.setup_dap({ hotcodereplace = "auto" })
      jdtls.setup.add_commands()

      require("jdtls.dap").setup_dap_main_class_configs()
    end,
  },
}

-- return {
--   {
--     "mfussenegger/nvim-jdtls",
--     ft = { "java" },
--     dependencies = {
--       "mason-org/mason.nvim",
--       "mason-org/mason-lspconfig.nvim",
--     },
--     config = function()
--       local augroup = vim.api.nvim_create_augroup("JdtlsAutostart", { clear = true })

--       vim.api.nvim_create_autocmd("FileType", {
--         group = augroup,
--         pattern = "java",
--         callback = function()
--           local jdtls = require("jdtls")

--           local mason_path = vim.fn.stdpath("data") .. "/mason"
--           local jdtls_path = mason_path .. "/packages/jdtls"

--           local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--           if jar == "" then
--             vim.notify("JDTLS nicht über Mason installiert", vim.log.levels.ERROR)
--             return
--           end

--           local os_config = vim.fn.has("macunix") == 1 and "config_mac"
--             or vim.fn.has("win32") == 1 and "config_win"
--             or "config_linux"

--           local root_dir = require("jdtls.setup").find_root({
--             "build.gradle", "settings.gradle",
--             "pom.xml", "mvnw", "gradlew", ".git",
--           }) or vim.fn.getcwd()

--           local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. vim.fn.sha256(root_dir)

--           local capabilities = vim.lsp.protocol.make_client_capabilities()
--           local ok, cmp = pcall(require, "cmp_nvim_lsp")
--           if ok then
--             capabilities = cmp.default_capabilities(capabilities)
--           end

--           local config = {
--             cmd = {
--               "java",
--               "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--               "-Dosgi.bundles.defaultStartLevel=4",
--               "-Declipse.product=org.eclipse.jdt.ls.core.product",
--               "-Xms1g",
--               "--add-modules=ALL-SYSTEM",
--               "--add-opens", "java.base/java.util=ALL-UNNAMED",
--               "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--               "-jar", jar,
--               "-configuration", jdtls_path .. "/" .. os_config,
--               "-data", workspace_dir,
--             },
--             root_dir = root_dir,
--             capabilities = capabilities,
--             settings = {
--               java = {
--                 eclipse = { downloadSources = true },
--                 maven = { downloadSources = true },
--                 format = { enabled = true },
--               },
--             },
--           }

--           jdtls.start_or_attach(config)
--           jdtls.setup_dap({ hotcodereplace = "auto" })
--           require("jdtls.dap").setup_dap_main_class_configs()
--         end,
--       })
--     end,
--   },
-- }

```

# 10) plugins/python.lua

```lua
-- plugins/python.lua

local function get_python_bin()
  local python_bin = vim.fn.getcwd() .. "/venv/bin/python"
  local f = io.open(python_bin, "r")
  if not f then
    error("Python-Binary nicht gefunden: " .. python_bin .. ". Bitte erstelle ein venv mit './venv'.")
  end
  f:close()
  return python_bin
end

local function get_ruff_bin()
  local ruff_bin = vim.fn.getcwd() .. "/venv/bin/ruff"
  local f = io.open(ruff_bin, "r")
  if not f then
    error("Ruff-Binary nicht gefunden: " .. ruff_bin .. ". Bitte installiere Ruff in deinem venv.")
  end
  f:close()
  return ruff_bin
end

return {
  -- Treesitter für Python
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },

  -- LSP: pylsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          cmd = { get_python_bin(), "-m", "pylsp" },
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = true },
                pycodestyle = { enabled = true },
                flake8 = { enabled = true },
                black = { enabled = true },
                ruff = { enabled = true, executable = get_ruff_bin() },
              },
            },
          },
        },
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },

  -- Ruff Linter Integration
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = {
          function()
            local bufname = vim.api.nvim_buf_get_name(0)
            if bufname == "" then
              return nil
            end
            return {
              cmd = get_ruff_bin(),
              args = { "--stdin-filename", bufname, "-" },
              stdin = true,
            }
          end,
        },
      },
    },
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("dap-python").setup(get_python_bin())
    end,
  },
}

```

# 11) plugins/html.lua

```lua
-- plugins/html.lua

return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node

      ls.add_snippets("html", {

        -- ! -> HTML5 Boilerplate
        s("!", {
          t({
            "<!DOCTYPE html>",
            "<html lang=\"en\">",
            "<head>",
            "    <meta charset=\"UTF-8\">",
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
            "    <title>",
          }),
          i(1, "Document"),
          t({
            "</title>",
            "</head>",
            "<body>",
            "",
            }),
          i(0),
          t({
            "",
            "</body>",
            "</html>",
          }),
        }),

        -- !! -> Minimal HTML
        s("!!", {
          t({
            "<!DOCTYPE html>",
            "<html>",
            "<head>",
            "    <title>",
          }),
          i(1, "Document"),
          t({
            "</title>",
            "</head>",
            "<body>",
            }),
          i(0),
          t({
            "",
            "</body>",
            "</html>",
          }),
        }),

        -- !!! -> Nur Body
        s("!!!", {
          t({
            "<body>",
            }),
          i(0),
          t({
            "",
            "</body>",
          }),
        }),

        -- div
        s("div", {
          t("<div>"),
          i(0),
          t("</div>"),
        }),

        -- span
        s("span", {
          t("<span>"),
          i(0),
          t("</span>"),
        }),

        -- p
        s("p", {
          t("<p>"),
          i(0),
          t("</p>"),
        }),

        -- a
        s("a", {
          t("<a href=\""),
          i(1, "#"),
          t("\">"),
          i(0),
          t("</a>"),
        }),

        -- img
        s("img", {
          t("<img src=\""),
          i(1),
          t("\" alt=\""),
          i(2),
          t("\" />"),
        }),

        -- link css
        s("css", {
          t("<link rel=\"stylesheet\" href=\""),
          i(0),
          t("\">"),
        }),

        -- script
        s("js", {
          t("<script src=\""),
          i(0),
          t("\"></script>"),
        }),

        -- comment
        s("com", {
          t("<!-- "),
          i(0),
          t(" -->"),
        }),
      })

      return opts
    end,
  },
}

```

---

# 12) plugins/dap.lua (codelldb + Rust/C++ Debug)

```lua
-- plugins/dap.lua

-- return {
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       {
--         "rcarriga/nvim-dap-ui",
--         dependencies = {
--           "nvim-neotest/nvim-nio",
--         },
--       },
--       "jay-babu/mason-nvim-dap.nvim",
--     },
--     config = function()
--       local dap = require("dap")
--       local dapui = require("dapui")

--       local mason_path = vim.fn.stdpath("data") .. "/mason"
--       local codelldb_path =
--         mason_path .. "/packages/codelldb/extension/adapter/codelldb"

--       require("mason-nvim-dap").setup({
--         ensure_installed = { "codelldb" },
--       })

--       dapui.setup()

--       dap.listeners.after.event_initialized["dapui"] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated["dapui"] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited["dapui"] = function()
--         dapui.close()
--       end

--       dap.adapters.codelldb = {
--         type = "server",
--         port = "${port}",
--         executable = {
--           command = codelldb_path,
--           args = { "--port", "${port}" },
--         },
--       }

--       dap.configurations.rust = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/target/debug/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.cpp = {
--         {
--           name = "Debug",
--           type = "codelldb",
--           request = "launch",
--           program = function()
--             return vim.fn.input(
--               "Path to executable: ",
--               vim.fn.getcwd() .. "/build/",
--               "file"
--             )
--           end,
--           cwd = "${workspaceFolder}",
--           stopOnEntry = false,
--           args = {},
--         },
--       }

--       dap.configurations.c = dap.configurations.cpp
--     end,
--    },
-- }

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

      -- Rust Debugger
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

      -- C++ Debugger
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

      dap.adapters.java = function(callback)
        callback({
          type = "server",
          host = "127.0.0.1",
          port = 5005,  -- Standardport für jdtls Debug
        })
      end

      dap.configurations.java = {
        {
          type = "java",
          request = "launch",
          name = "Debug Current File",
          mainClass = "${file}", 
          projectName = "MeinProjekt",
          cwd = vim.fn.getcwd(),
          console = "integratedTerminal",
        },
      }
    end,
  },
}

```

# 13) config/autocmds.lua

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

-- -- Always end file with newline
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--     if #lines == 0 or lines[#lines] ~= "" then
--       vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "text", "rust", "c", "cpp", "java", "lua", "latex" },
--   callback = function()
--     vim.opt_local.spell = true
--     vim.opt_local.spelllang = { "en_us" }
--   end,
-- })

local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
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

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "markdown", "text", "latex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "rust_analyzer" then
      vim.lsp.codelens.refresh()
    end
  end,
})

vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWritePost", "InsertLeave" },
  {
    group = augroup,
    pattern = "*.rs",
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  }
)

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "rust",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, opts)      -- VS Code
    vim.keymap.set("n", "<leader>rir", function() run_in_term("idea .") end, opts)      -- IntelliJ
    vim.keymap.set("n", "<leader>rra", ":split | terminal cargo build && cargo run<CR>", opts)
    vim.keymap.set("n", "<leader>rrr", ":split | terminal cargo run<CR>", opts)
    vim.keymap.set("n", "<leader>rrb", ":split | terminal cargo build<CR>", opts)
    vim.keymap.set("n", "<leader>rrt", ":split | terminal cargo test<CR>", opts)
    vim.keymap.set("n", "<leader>rrc", ":edit Cargo.toml<CR>", opts)
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, opts)

    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, opts)

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, opts)

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "java",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, opts)
    vim.keymap.set("n", "<leader>rir", function() run_in_term("idea .") end, opts)
    vim.keymap.set("n", "<leader>rra", ":split | terminal sh -c './gradlew build && ./gradlew run'<CR>", opts)
    vim.keymap.set("n", "<leader>rrr", ":split | terminal ./gradlew run<CR>", opts)
    vim.keymap.set("n", "<leader>rrb", ":split | terminal ./gradlew build<CR>", opts)
    vim.keymap.set("n", "<leader>rrt", ":split | terminal ./gradlew test<CR>", opts)
    vim.keymap.set("n", "<leader>rrg", ":edit build.gradle<CR>", opts)
        vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, opts)

    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end, opts)

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, opts)

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, opts)

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp" },
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, opts)
    vim.keymap.set("n", "<leader>rir", function() run_in_term("eclipse") end, opts)
    vim.keymap.set(
      "n",
      "<leader>rra",
      ":split | terminal sh -c 'cmake -S . -B build && cmake --build build && ./build/app'<CR>",
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>rrr",
      ":split | terminal ./build/app<CR>",
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>rrb",
      ":split | terminal cmake --build build<CR>",
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>rrt",
      ":split | terminal sh -c 'cd build && ctest'<CR>",
      opts
    )

    vim.keymap.set(
      "n",
      "<leader>rrg",
      ":edit CMakeLists.txt<CR>",
      opts
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "python",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, opts)      -- VS Code
    vim.keymap.set("n", "<leader>rir", function() run_in_term("pycharm .") end, opts)  -- PyCharm
    vim.keymap.set("n", "<leader>rrr", ":split | terminal python3 %<CR>", opts)
    vim.keymap.set("n", "<leader>rrt", ":split | terminal pytest<CR>", opts)
    vim.keymap.set("n", "<leader>rrv", ":split | terminal python3 -m venv .venv<CR>", opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "c",
  callback = function()
    vim.keymap.set("n", "<leader>rid", function() run_in_term("code .") end, opts)      -- VS Code
    vim.keymap.set("n", "<leader>rir", function() run_in_term("eclipse") end, opts)     -- Eclipse
    vim.keymap.set("n", "<leader>rrb", function() run_in_term("gcc % -o %:r") end, opts)
    vim.keymap.set("n", "<leader>rrr", function() run_in_term("./%:r") end, opts)
  end,
})

```

# 14) plugins/mason.lua

```lua
-- lua/plugins/mason.lua

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "clangd",
        "codelldb",
        "jdtls",
        "ltex-ls",
        "java-debug-adapter",
        "java-test",
        -- "vscode-java-test",
        -- "pyright", -- gibt es nicht 
        -- "pylsp", -- gibt es nicht
        -- "black",
        -- "ruff",
        -- "debugpy",
        -- "mypy",
      },
    },
  },
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = { "Git", "G" },
  -- },
}

```

# 15) plugins/github_theme.lua

```lua
-- plugins/github_theme.lua

-- return {
--   {
--     "projekt0n/github-nvim-theme",
--     name = "github-theme",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("github-theme").setup({})
--       vim.cmd("colorscheme github_dark_dimmed")
--     end
--   },
-- }

```

# 16) plugins/nightfox.lua

```lua
-- plugins/nightfox.lua

-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     name = "nightfox",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("nightfox").setup({
--         options = {
--           transparent = false,
--           terminal_colors = true,
--         },
--         -- andere Optionen hier falls gewünscht
--       })
--       -- Setze Carbonfox als Farben-Schema
--       vim.cmd("colorscheme carbonfox")
--     end
--   },
-- }

return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          terminal_colors = true,
        },
      })

      vim.cmd("colorscheme carbonfox")

      -- GLOBAL: alles transparent machen
      -- local groups = {
      --   "Normal",
      --   "NormalNC",
      --   "NormalFloat",
      --   "FloatBorder",
      --   "SignColumn",
      --   "EndOfBuffer",
      --   "LineNr",
      --   "CursorLineNr",
      --   "VertSplit",
      --   "WinSeparator",
      -- }

      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "EndOfBuffer",
        "LineNr",
        "CursorLineNr",
        "VertSplit",
        "WinSeparator",
        "TabLine",
        "TabLineSel",
        "TabLineFill",
        "StatusLine",
        "StatusLineNC",
        "WinBar",
        "WinBarNC",
      }

      for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end,
  },
}

```

# 17) plugins/ui.lua

```lua
-- plugins/ui.lua

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

# 18) plugins/treesitter.lua

```lua
-- plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "c", "cpp", "rust", "java", "kotlin",
        "lua", "python", "javascript", "typescript",
        "toml", "yaml", "json", "json5", "ini", "xml",
        "makefile", "cmake", "gradle", "bash", "sh",
        "markdown", "markdown_inline", "rst", "latex",
        "html", "css", "sql"
      },
      highlight = { enable = true },
    },
  },
}

```

# 19) plugins/markdown.lua

```lua
-- plugins/markdown.lua

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

# 20) plugins/ltex.lua

```lua
-- plugins/ltex.lua

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
            -- "rust",
            -- "c",
            -- "cpp",
            -- "java",
            -- "lua",
            -- "python",
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

# 21) plugins/notify.lua

```lua
-- plugins/notify.lua

-- local old_notify = vim.notify

-- vim.notify = function(msg, log_level, opts)
--   local text = nil

--   if type(msg) == "string" then
--     text = msg
--   elseif type(msg) == "table" and type(msg.msg) == "string" then
--     text = msg.msg
--   end

--   if text and text:lower():match("reload.*cargo workspace") then
--     return
--   end

--   if old_notify then
--     pcall(old_notify, msg, log_level, opts)
--   else
--     if type(msg) == "string" then
--       vim.api.nvim_echo({ { msg } }, true, {})
--     end
--   end
-- end

```

# 22) plugins/git.lua

```lua
-- plugins/git.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
}
```

# 23) plugins/dash.lua

```lua
-- plugins/dash.lua

-- return {
--   "nvimdev/dashboard-nvim",
--   lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
--   opts = function()
--     local logo = [[
--         ██████╗       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗         Z
--         ██╔══██╗      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     Z    
--         ██████╔╝█████╗██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  z       
--         ██╔═══╝ ╚════╝██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║z         
--         ██║           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          
--         ╚═╝           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          
--     ]]

--     logo = string.rep("\n", 8) .. logo .. "\n\n"

--     local opts = {
--       theme = "doom",
--       hide = {
--         -- this is taken care of by lualine
--         -- enabling this messes up the actual laststatus setting after loading a file
--         statusline = false,
--       },
--       config = {
--         header = vim.split(logo, "\n"),
--         -- stylua: ignore
--         center = {
--           { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
--           { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
--           { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
--           { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
--           { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
--           { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
--           { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
--           { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
--           { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
--         },
--         footer = function()
--           local stats = require("lazy").stats()
--           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--           return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
--         end,
--       },
--     }

--     for _, button in ipairs(opts.config.center) do
--       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
--       button.key_format = "  %s"
--     end

--     -- open dashboard after closing lazy
--     if vim.o.filetype == "lazy" then
--       vim.api.nvim_create_autocmd("WinClosed", {
--         pattern = tostring(vim.api.nvim_get_current_win()),
--         once = true,
--         callback = function()
--           vim.schedule(function()
--             vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
--           end)
--         end,
--       })
--     end

--     return opts
--   end,
-- }
```

# 24) config/lazyvim.lua

Es gab: completion.cmp.enable is now deperecated, the nvim-cmp source will be romoved soon. Use the in-process la...

Lösung:

```lua
-- config/lazyvim.lua
-- return {
--   -- disable lazyvim's builtin cmp
--   { "hrsh7th/nvim-cmp", enabled = false },
-- }
```
