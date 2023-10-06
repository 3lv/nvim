Prerequires:
* nvim
* git, curl, tar, unzip, gzip, c compiler (gcc/mingw gcc/ zig)
* npm (for some LSP installations)
* more for windows (TODO: complete this list)


## Features
*Clean! Minimal! Fast!*

Keep the default keybindings and functions, but makes everything easier with intuitive, dynamic highlighting!

Everything is improved, not changed!


## Installation
##### Backup old config (if needed)
### Install nvim config + plugins
```bash
git clone https://github.com/3lv/nvim ~/.config/nvim
nvim --headless +Setup # optional
```
### Installation for Windows (Command Prompt) (Not tested)
```pwsh
git clone https://github.com/3lv/nvim %userprofile%\AppData\Local\nvim
nvim --headless +Setup # optional
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
