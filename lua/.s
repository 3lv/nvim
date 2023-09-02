let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +74 workspace/nvim/bootstrap.nvim/lua/bootstrap.lua
badd +6 term://~//3928:/bin/bash
badd +0 term://~//4152:/bin/bash
badd +6 bin/myaskpass
badd +0 .chestiirandom.sh
badd +23 .config/nvim/lua/plugins/lazy.lua
badd +59 .gitignore
badd +12 .install.sh
badd +22 .config/nvim/README.md
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit .config/nvim/lua/plugins/lazy.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 1resize ' . ((&columns * 120 + 120) / 240)
exe '2resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 2resize ' . ((&columns * 120 + 120) / 240)
exe '3resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 3resize ' . ((&columns * 119 + 120) / 240)
exe '4resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 4resize ' . ((&columns * 119 + 120) / 240)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 23 - ((22 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 073|
lcd ~/.config/nvim/lua
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/lazy.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/lazy.lua | else | edit ~/.config/nvim/lua/plugins/lazy.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/lazy.lua
endif
balt ~/workspace/nvim/bootstrap.nvim/lua/bootstrap.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 23 - ((22 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 073|
lcd ~/.config/nvim/lua
wincmd w
argglobal
if bufexists(fnamemodify("~/.chestiirandom.sh", ":p")) | buffer ~/.chestiirandom.sh | else | edit ~/.chestiirandom.sh | endif
if &buftype ==# 'terminal'
  silent file ~/.chestiirandom.sh
endif
balt term://~//3928:/bin/bash
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((8 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 039|
wincmd w
argglobal
if bufexists(fnamemodify("term://~//3928:/bin/bash", ":p")) | buffer term://~//3928:/bin/bash | else | edit term://~//3928:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~//3928:/bin/bash
endif
balt ~/.chestiirandom.sh
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10032 - ((31 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10032
normal! 032|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 1resize ' . ((&columns * 120 + 120) / 240)
exe '2resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 2resize ' . ((&columns * 120 + 120) / 240)
exe '3resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 3resize ' . ((&columns * 119 + 120) / 240)
exe '4resize ' . ((&lines * 32 + 33) / 67)
exe 'vert 4resize ' . ((&columns * 119 + 120) / 240)
if exists(':tcd') == 2 | tcd ~/.config/nvim/lua | endif
tabnext
argglobal
if bufexists(fnamemodify("term://~//4152:/bin/bash", ":p")) | buffer term://~//4152:/bin/bash | else | edit term://~//4152:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~//4152:/bin/bash
endif
balt term://~//3928:/bin/bash
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
if exists(':tcd') == 2 | tcd ~ | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
