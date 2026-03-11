# IDEA Config

Windows: 
```bash 
C:\Users\DeinName\.ideavimrc
```

macOS/Linux: 
```bash 
~/.ideavimrc
```

```text
" --- ALLGEMEINE SETTINGS ---
set clipboard+=unnamedplus  " Entspricht vim.useSystemClipboard: true
set incsearch               " Entspricht vim.incsearch
set hlsearch                " Entspricht vim.hlsearch
set smartcase               " Entspricht search.smartCase
set number relativenumber   " Falls du relative Zeilen willst
set scrolloff=8             " Komfort beim Scrollen

" Tabs & Einrückung
set tabstop=4
set shiftwidth=4
set expandtab

" --- PLUGINS (IdeaVim Extensions) ---
set surround                " Entspricht vim.surround
set commentary              " Entspricht vim.commentary
set argtextobj              " Erlaubt 'cia' (change in argument)

" --- KEYBINDINGS ---
let mapleader=" "           " Entspricht vim.leader: <space>

" Blackhole Register für 'd' (Löschen ohne zu kopieren)
" Entspricht deinen vim.normalModeKeyBindingsNonRecursive
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd

" 'u' und 'Ctrl-j' / 'Ctrl-b' freigeben (falls du IntelliJ Shortcuts willst)
" In IdeaVim musst du Keys aktiv ignorieren, wenn sie NICHT von Vim gefangen werden sollen
set handler+=<C-b>:ide
set handler+=<C-j>:ide

" --- OPTIONAL: IDE ACTIONS ---
" Schnelles Speichern (statt :w)
nnoremap <leader>w :action      FileStructurePopup<CR> 
```
