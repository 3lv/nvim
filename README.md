Prerequires:
* nvim 0.5+
* (optional)ccls

## Features
*Clean! Minimal! Fast!*

Keep the default keybindings and functions, but makes everything easier with intuitive, dynamic highlightings!

Everything is improved, not changed!

**Pink**👩‍🎤 colors

Transparent changing statusline

## Install config
##### Backup old config (if needed)
```bash
mv ~/.config/nvim ~/.config/nvim-backup
```
```bash
git clone https://github.com/3lv/nvim ~/.config/nvim
nvim --headless "+Lazy! sync" +qa # optional
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
