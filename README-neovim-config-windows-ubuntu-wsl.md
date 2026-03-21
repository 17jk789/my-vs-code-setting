# SOON

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

WezTerm:

```bash
code .wezterm.lua
```

```lua
local wezterm = require("wezterm")

return {
	-- WINDOW / UI
	window_decorations = "RESIZE",
	window_padding = {
		left = 6,
		right = 6,
		top = 4,
		bottom = 4,
	},

	-- BLUR (Windows Acrylic)
	win32_system_backdrop = "Acrylic",
	window_background_opacity = 0.8,
	text_background_opacity = 1.0,

	-- FONT
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 13.5,

	-- CURSOR
	default_cursor_style = "SteadyBlock",

	-- 🎨 CATPPUCCIN THEME (richtig geschrieben!)
	color_scheme = "Catppuccin Mocha",

	-- Farben (nur Cursor überschreiben, NICHT background doppelt!)
	colors = {
		cursor_bg = "#25be6a",
		cursor_fg = "#f2f4f8",
	},

	-- 🐚 STANDARD SHELL = PowerShell (WICHTIG)
	default_prog = { "pwsh.exe" }, -- PowerShell Core
	-- Alternative (falls nicht installiert):
	-- default_prog = { "powershell.exe" },

	-- TERMINAL
	term = "xterm-256color",
	scrollback_lines = 30000000,

	-- TAB / SPLIT
	enable_tab_bar = true,

	-- KEYBINDS
	keys = {
		{ key = "m", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
		{ key = "n", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },

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


```bash
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
```


JetBrainsMonoNerdFontMono-Regular.ttf
JetBrainsMonoNerdFontMono-Bold.ttf
JetBrainsMonoNerdFontMono-Italic.ttf
JetBrainsMonoNerdFontMono-BoldItalic.ttf

JetBrainsMono Nerd Font
