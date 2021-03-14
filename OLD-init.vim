set runtimepath+=~/.fzf

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:fzf_preview_window = ['right:60%', 'ctrl-/']

call plug#begin()
Plug 'takac/vim-hardtime'
"Plug 'markonm/traces.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'caenrique/nvim-toggle-terminal'
"Plug 'AndrewRadev/undoquit.vim'
"Plug '3lv/UndoLayout'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lifepillar/vim-solarized8'
Plug 'SirVer/ultisnips'
"Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set clipboard=unnamedplus
set guicursor=

let g:hardtime_default_on = 1
let g:hardtime_timeout = 50
let g:hardtime_maxcount = 2

command! -bang -nargs=* Rgh
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


set encoding=utf-8

command! E NERDTreeToggle

"let NERDTreeHighlightCursorline = 0
let NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeMinimalUI=1

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:airline#extensions#tabline#enabled = 1

set termguicolors
let g:solarized_termtrans=1
colorscheme solarized8_high

filetype plugin indent on

let g:airline_powerline_fonts = 1

"set clipboard=unnamed

set encoding=utf-8
set path+=**
set nu rnu
"set colorcolumn=81
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set hlsearch
set incsearch
set shortmess=IO
set belloff=all
set display=truncate                   " @@@ in last line if truncated
set wildmenu                           " list of commands when completing
set ruler                              " % of file
set showcmd   "defaulut on for windows " partial command in bot right
set scrolloff=3                  " screen scrolls when getting in the last lines
set listchars=tab:\¦\ ,trail:\
set tabstop=4
"set softtabstop=4
set noexpandtab
set shiftwidth=4
"VVV are good
"set smartindent
set linebreak
set tw=160
set backspace=indent,eol,start         " backspace in insert mode
set sessionoptions-=options
set suffixesadd=.cpp,.vim,.txt,.in,.out
set wildignore=*.exe
set undofile
"set undodir=C:\Users\vlad\storage\tmp
"set directory=C:\Users\vlad\storage\tmp
"set backupdir=C:\Users\vlad\storage\tmp
set viminfo='20,<1000,s1000,h
set history=200                        " command line history size

set lazyredraw


"in testing
set switchbuf=useopen

set inccommand=split


"let &shell = has('win32') ? 'powershell' : 'pwsh'
"set shellquote= shellpipe=\| shellxquote=
"set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
"set shellredir=\|\ Out-File\ -Encoding\ UTF8


" BUFFERS: {{{
set hidden
set autoread
" }}}

" NETRW: {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = -30
let g:netrw_sort_sequence = '[\/]$,\.cpp$,\.txt$,\.in,\.out,*'
let g:netrw_list_hide = '.*\.exe'
" }}}

" COMPILE: {{{
"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r<CR>
augroup compile
"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 %:r.cpp -o %:r.exe && %:r.exe < %:r.in > %:r.out

"build and run
autocmd filetype cpp nnoremap <F9> :wa <bar> make %:r <bar> !./%:r < %:r.in > %:r.out<CR>
autocmd filetype cpp nnoremap <F21> :wa <bar> make %:r <bar> :!./%:r<CR>

"run
autocmd filetype cpp nnoremap <F10> :!./%:r < %:r.in > %:r.out<CR>
autocmd filetype cpp nnoremap <F22> :!./%:r<CR>

augroup EXIT
" }}}

" MAPS: {{{
inoremap {<CR> {<CR>}<Esc>O|            " auto { brackets + space between
inoremap <C-U> <C-G>u<C-U>|             " can undo CTRL-U
autocmd filetype cpp nnoremap <F2> :bo 40vs %:r.in <bar> setlocal nu nornu <bar> set wfw wfh<CR>
autocmd filetype cpp nnoremap <F3> :bel sp %:r.out <bar> setlocal nu nornu <bar> set wfw wfh<CR>
autocmd filetype cpp nnoremap <silent> <C-C> :s@\v^(\s*)@\1//@e<CR> :s@\v^(\s*)////@\1@e<CR>
" }}}

" vim: set foldmethod=marker foldlevel=0 fillchars=fold\:- :
