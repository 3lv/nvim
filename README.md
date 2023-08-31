Prerequires:
* nvim


## Features
*Clean! Minimal! Fast!*

Keep the default keybindings and functions, but makes everything easier with intuitive, dynamic highlighting!

Everything is improved, not changed!


## Install config
##### Backup old config (if needed)
```bash
mv ~/.config/nvim ~/.config/nvim-backup
```
### Install nvim config + entire system
```bash
git clone https://github.com/3lv/nvim ~/.config/nvim
nvim --headless +Setup && sudo ~/.install.sh
```


### Config layout
```lua
~/.config/nvim/..
📂 lua
│ 📂 lib
│ 📂 plugins
│ 🌑 keymaps.lua
└ 🌑 options.lua
🌑 init.lua
```
