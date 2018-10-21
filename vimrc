syntax enable "this enables sintax processing
set termguicolors "enables colors

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set foldmethod=indent
set foldnestmax=1
set foldlevel=1
set nofoldenable
set number
set showcmd
filetype indent on
set wildmenu
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
"leader key is \
"set nofoldenable
set laststatus=2
set splitright
map <C-f> :NERDTreeToggle<CR>
set mouse=a "adds mouse click
set noshowmode
set ttimeoutlen=100
map <S-d> di
autocmd VimResized * wincmd =

"o on line with comment won't generate a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"=======START VIM-PLUG SECTION=======
call plug#begin('~/.vim/plugged')

"======THEMES========================
Plug 'KeitaNakamura/neodark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'kaicataldo/material.vim'
"======OTHER PLUGINS=================
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
"=======END VIM-PLUG SECTION========

"=======APPEARENCE SECTIONS=========

"neodark theme setup
"let g:neodark#terminal_transparent = 1 " default: 0
"colorscheme neodark

"One half dark theme setup
colorscheme material "onehalfdark
highlight Comment cterm=italic
let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"======END APPEARENCE SECTION=======
