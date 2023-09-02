Prerequires:
* nvim


## Features
*Clean! Minimal! Fast!*

Keep the default keybindings and functions, but makes everything easier with intuitive, dynamic highlighting!

Everything is improved, not changed!


## Installation
##### Backup old config (if needed)
### Install nvim config + plugins
```bash
git clone https://github.com/3lv/nvim ~/.config/nvim
nvim --headless +Plugins # optional
```
### Install full system
```bash
git clone https://github.com/3lv/nvim ~/.config/nvim
nvim --headless +Setup && sudo ~/.install.sh
```
### Installation for Windows (Command Prompt) (Not tested)
```pwsh
winget install -e --id zig.zig  # c compiler required
curl -LO https://github.com/3lv/nvim/archive/master.zip
tar -xf master.zip
del master.zip
move nvim-master %userprofile%\Appdata\Local\nvim
# restart ?command prompt?
nvim --headless +Plugins # optional
```


## Config layout
```lua
~/.config/nvim/..
📂 lua
│ 📂 lib
│ 📂 plugins
│ 🌑 keymaps.lua
└ 🌑 options.lua
🌑 init.lua
```
