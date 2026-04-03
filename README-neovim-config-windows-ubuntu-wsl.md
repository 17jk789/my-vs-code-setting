# Windows Config

Install WSL and use `README-neovim-config-Ubuntu.md`.

## Windows Terminal

```json
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "actions": 
    [
        {
            "command": 
            {
                "action": "closeTab"
            },
            "id": "User.closeTab.0"
        },
        {
            "command": 
            {
                "action": "adjustFontSize"
            },
            "id": "User.adjustFontSize.D3F0B923"
        }
    ],
    "copyFormatting": "none",
    "copyOnSelect": false,
    "defaultProfile": "{...}",
    "initialCols": 133,
    "initialRows": 33,
    "keybindings": 
    [
        {
            "id": "Terminal.PrevTab",
            "keys": "ctrl+shift+tab"
        },
        {
            "id": "Terminal.CopyToClipboard",
            "keys": "ctrl+c"
        },
        {
            "id": "Terminal.SplitPaneRight",
            "keys": "ctrl+shift+o"
        },
        {
            "id": "Terminal.PasteFromClipboard",
            "keys": "ctrl+shift+v"
        },
        {
            "id": "Terminal.PasteFromClipboard",
            "keys": "ctrl+v"
        },
        {
            "id": "Terminal.FindText",
            "keys": "ctrl+shift+f"
        },
        {
            "id": "User.closeTab.0",
            "keys": "ctrl+shift+w"
        },
        {
            "id": "Terminal.DuplicatePaneAuto",
            "keys": "alt+shift+d"
        },
        {
            "id": "Terminal.DecreaseFontSize",
            "keys": "ctrl+minus"
        },
        {
            "id": "Terminal.IncreaseFontSize",
            "keys": "ctrl+plus"
        },
        {
            "id": "Terminal.CopyToClipboard",
            "keys": "ctrl+shift+c"
        },
        {
            "id": "Terminal.OpenNewTab",
            "keys": "ctrl+shift+t"
        },
        {
            "id": "Terminal.SplitPaneDown",
            "keys": "ctrl+shift+e"
        },
        {
            "id": "Terminal.NextTab",
            "keys": "ctrl+tab"
        },
        {
            "id": "Terminal.ResetFontSize",
            "keys": "ctrl+0"
        },
        {
            "id": "Terminal.ToggleFullscreen",
            "keys": "ctrl+shift+m"
        },
        {
            "id": null,
            "keys": "ctrl+m"
        }
    ],
    "newTabMenu": 
    [
        {
            "type": "remainingProfiles"
        }
    ],
    "profiles": 
    {
        "defaults": 
        {
            "backgroundImageOpacity": 0.25,
            "backgroundImageStretchMode": "uniformToFill",
            "colorScheme": "catppuccin-mocha",
            "cursorColor": "#25BE6A",
            "cursorShape": "filledBox",
            "font": 
            {
                "face": "JetBrainsMono Nerd Font",
                "size": 11
            },
            "opacity": 80,
            "useAcrylic": true
        },
        "list": 
        [
            ...
        ]
    },
    "schemes": 
    [
        {
            "background": "#1E1E2E",
            "black": "#45475A",
            "blue": "#89B4FA",
            "brightBlack": "#585B70",
            "brightBlue": "#89B4FA",
            "brightCyan": "#94E2D5",
            "brightGreen": "#A6E3A1",
            "brightPurple": "#CBA6F7",
            "brightRed": "#F38BA8",
            "brightWhite": "#A6ADC8",
            "brightYellow": "#F9E2AF",
            "cursorColor": "#F5E0DC",
            "cyan": "#94E2D5",
            "foreground": "#CDD6F4",
            "green": "#A6E3A1",
            "name": "catppuccin-mocha",
            "purple": "#CBA6F7",
            "red": "#F38BA8",
            "selectionBackground": "#45475A",
            "white": "#BAC2DE",
            "yellow": "#F9E2AF"
        },
        {
            "background": "#000000",
            "black": "#0C0C0C",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#00FF00",
            "cyan": "#3A96DD",
            "foreground": "#00FF00",
            "green": "#13A10E",
            "name": "green",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#00FF00",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        },
        {
            "background": "#000000",
            "black": "#0C0C0C",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#00FF00",
            "cyan": "#3A96DD",
            "foreground": "#D9D9D9",
            "green": "#13A10E",
            "name": "jk-peharge-theme",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#FFFFFF",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        }
    ],
    "themes": []
}
```

## WezTerm:

```bash
# winget install --id wez.wezterm -e
winget install wez.wezterm
code .wezterm.lua
```

```lua
local wezterm = require("wezterm")

return {
	-- WINDOW / UI
	window_decorations = "RESIZE",
	window_padding = {
		left = 4,
		right = 4,
		top = 2,
		bottom = 2,
	},

	initial_cols = 110,  -- Breite
	initial_rows = 25,   -- Höhe

	-- BLUR (Windows Acrylic)
	win32_system_backdrop = "Acrylic",
	window_background_opacity = 0.8,
	text_background_opacity = 1.0,

	-- FONT
	font = wezterm.font_with_fallback {
		"JetBrainsMono Nerd Font",  -- Hauptfont für Text + Icons
		"Segoe UI Emoji",           -- Emoji-Fallback
		"Noto Color Emoji",         -- alternative Fallbacks
	},
	font_size = 13.5,

	-- CURSOR
	default_cursor_style = "SteadyBlock",

	-- 🎨 CATPPUCCIN THEME (richtig geschrieben!)
	color_scheme = "Catppuccin Mocha",

	-- Farben (nur Cursor überschreiben, NICHT background doppelt!)
	colors = {
		cursor_bg = "#f5a97f",
		cursor_fg = "#1e1e2e",

		tab_bar = {
			background = "#1e1e2e",  -- gleiche Farbe wie das Fenster-Hintergrund-Theme

			active_tab = {
				bg_color = "#1e1e2e",      -- gleiche Farbe wie Hintergrund
				fg_color = "#f5a97f",      -- Textfarbe aktive Tab
				-- fg_color = "#ffffff",
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			-- inactive_tab = {
			-- 	bg_color = "#181825",      -- leicht dunkler als Hintergrund
			-- 	fg_color = "#cdd6f4",      -- Textfarbe inaktive Tab
			-- },

			-- inactive_tab_hover = {
			-- 	bg_color = "#1c1b26",      -- beim Hover etwas heller
			-- 	fg_color = "#cdd6f4",
			-- },

			-- new_tab = {
			-- 	bg_color = "#1e1e2e",
			-- 	fg_color = "#94e2d5",
			-- },

			-- new_tab_hover = {
			-- 	bg_color = "#1c1b26",
			-- 	fg_color = "#94e2d5",
			-- },
		},
	},

	-- 🐚 STANDARD SHELL = PowerShell (WICHTIG)
	-- default_prog = { "pwsh.exe" }, -- PowerShell Core
    -- default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "/mnt/c/Users/julia" },
    default_prog = { "pwsh.exe", "-NoLogo", "-NoExit", "-Command", "wsl.exe -d Ubuntu --cd /mnt/c/Users/julia" },
	-- Alternative (falls nicht installiert):
	-- default_prog = { "powershell.exe" },

	-- TERMINAL
	term = "xterm-256color",
	scrollback_lines = 3000000,

	-- TAB / SPLIT
	enable_tab_bar = true,

	-- KEYBINDS
	keys = {
		{ key = "m", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
		{ key = "n", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
		{ key = "Enter", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },

		-- Tabs
		{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

		-- Splits
		{ key = "o", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Navigation
		{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

		-- Resize
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 10 }) },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 10 }) },
		{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 10 }) },
		{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 10 }) },

		-- Clipboard
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

		-- Font size
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	},
}

```

## Alecritty:

```bash
winget install Alacritty.Alacritty

cd .\AppData\Roaming
mkdir alacritty
cd alacritty
vim .\alacritty.toml
```

```text
# ─── WINDOW / UI ─────────────────────────────────────────────
[window]
decorations = "None"
# decorations = "Full"
opacity = 0.80
blur = true

padding = { x = 4, y = 2 }
dimensions = { columns = 110, lines = 25 }

# ─── FONT ────────────────────────────────────────────────────
[font]
size = 13.5

normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
bold   = { family = "JetBrainsMono Nerd Font", style = "Bold" }
italic = { family = "JetBrainsMono Nerd Font", style = "Italic" }

# ─── CURSOR ──────────────────────────────────────────────────
[cursor]
style = { shape = "Block", blinking = "Never" }

# ─── TERMINAL ────────────────────────────────────────────────
[terminal]
osc52 = "CopyPaste"

[env]
TERM = "xterm-256color"

[scrolling]
history = 30000

# ─── WSL START ───────────────────────────────────────────────
[terminal.shell]
program = "wsl.exe"
args = ["-d", "Ubuntu", "--cd", "~"]

# ─── COLORS ──────────────────────────────────────────────────
[colors.primary]
background = "#1E1E2E"
foreground = "#CDD6F4"

[colors.cursor]
text   = "#1E1E2E"
cursor = "#F5A97F"

[colors.selection]
text       = "#1E1E2E"
background = "#F5E0DC"

[colors.normal]
black   = "#45475A"
red     = "#F38BA8"
green   = "#A6E3A1"
yellow  = "#F9E2AF"
blue    = "#89B4FA"
magenta = "#F5C2E7"
cyan    = "#94E2D5"
white   = "#BAC2DE"

[colors.bright]
black   = "#585B70"
red     = "#F38BA8"
green   = "#A6E3A1"
yellow  = "#F9E2AF"
blue    = "#89B4FA"
magenta = "#F5C2E7"
cyan    = "#94E2D5"
white   = "#A6ADC8"

# ─── KEYBINDS ───────────────────────────────────────────────

# Window
[[keyboard.bindings]]
key = "M"
mods = "Control"
action = "ToggleFullscreen"

[[keyboard.bindings]]
key = "N"
mods = "Control|Shift"
action = "CreateNewWindow"

[[keyboard.bindings]]
key = "Q"
mods = "Control|Shift"
action = "Quit"

# ─── SEND KEYS (für Zellij → Splits/Tabs funktionieren!) ───

# New Tab (Ctrl+Shift+T)
[[keyboard.bindings]]
key = "T"
mods = "Control|Shift"
chars = "\u0014"

# Close Tab (Ctrl+Shift+W)
[[keyboard.bindings]]
key = "W"
mods = "Control|Shift"
chars = "\u0017"

# Split Right (Ctrl+Shift+O)
[[keyboard.bindings]]
key = "O"
mods = "Control|Shift"
chars = "\u000f"

# Split Down (Ctrl+Shift+E)
[[keyboard.bindings]]
key = "E"
mods = "Control|Shift"
chars = "\u0005"

# Zoom (Ctrl+Shift+Enter)
[[keyboard.bindings]]
key = "Enter"
mods = "Control|Shift"
chars = "\u000d"

# ─── Navigation (ALT Pfeile → durchreichen) ───

[[keyboard.bindings]]
key = "Left"
mods = "Alt"
chars = "\u001b[D"

[[keyboard.bindings]]
key = "Right"
mods = "Alt"
chars = "\u001b[C"

[[keyboard.bindings]]
key = "Up"
mods = "Alt"
chars = "\u001b[A"

[[keyboard.bindings]]
key = "Down"
mods = "Alt"
chars = "\u001b[B"

# ─── Resize (ALT+SHIFT) ───

[[keyboard.bindings]]
key = "Left"
mods = "Alt|Shift"
chars = "\u001b[1;4D"

[[keyboard.bindings]]
key = "Right"
mods = "Alt|Shift"
chars = "\u001b[1;4C"

[[keyboard.bindings]]
key = "Up"
mods = "Alt|Shift"
chars = "\u001b[1;4A"

[[keyboard.bindings]]
key = "Down"
mods = "Alt|Shift"
chars = "\u001b[1;4B"

# ─── Clipboard ───────────────────────────────────────────────

[[keyboard.bindings]]
key = "C"
mods = "Control|Shift"
action = "Copy"

[[keyboard.bindings]]
key = "V"
mods = "Control|Shift"
action = "Paste"

# ─── Font ────────────────────────────────────────────────────

[[keyboard.bindings]]
key = "Equals"
mods = "Control"
action = "IncreaseFontSize"

[[keyboard.bindings]]
key = "Minus"
mods = "Control"
action = "DecreaseFontSize"

[[keyboard.bindings]]
key = "Key0"
mods = "Control"
action = "ResetFontSize"

```

## Install NeoVim

```bash
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo apt install wslu
```

## Nerdfonz:

```bash
Get-ChildItem -Path "$env:LOCALAPPDATA\Microsoft\Windows\Fonts" -Filter *.ttf
```

JetBrainsMonoNerdFont-Regular.ttf

und noch (etv.)

JetBrainsMonoNerdFont-Bold.ttf
JetBrainsMonoNerdFont-Italic.ttf

<!-- JetBrainsMonoNerdFontMono-Regular.ttf
JetBrainsMonoNerdFontMono-Bold.ttf
JetBrainsMonoNerdFontMono-Italic.ttf
JetBrainsMonoNerdFontMono-BoldItalic.ttf -->
