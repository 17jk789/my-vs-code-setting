



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
            "id": null,
            "keys": "ctrl+plus"
        },
        {
            "id": null,
            "keys": "ctrl+minus"
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
            "opacity": 40,
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
        },
        {
            "cursorColor": "#F5E0DC",
            "selectionBackground": "#585B70",

            "background": "#1E1E2E",
            "foreground": "#CDD6F4",

            "black": "#45475A",
            "red": "#F38BA8",
            "green": "#A6E3A1",
            "yellow": "#F9E2AF",
            "blue": "#89B4FA",
            "purple": "#F5C2E7",
            "cyan": "#94E2D5",
            "white": "#BAC2DE",

            "brightBlack": "#585B70",
            "brightRed": "#F38BA8",
            "brightGreen": "#A6E3A1",
            "brightYellow": "#F9E2AF",
            "brightBlue": "#89B4FA",
            "brightPurple": "#F5C2E7",
            "brightCyan": "#94E2D5",
            "brightWhite": "#A6ADC8"
        }
    ],
    // "showTabsInTitlebar": true,
    // "tabWidthMode": "equal",
    "themes": [],
    // "useAcrylicInTabRow": true
}

```

```bash
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
```
