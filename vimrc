syntax enable "this enables sintax processing
filetype plugin indent on
autocmd VimResized * wincmd =
"o on line with comment won't generate a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"==============SET=====================
set termguicolors "enables colors
set softtabstop=4
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
set wildmenu
set incsearch
set hlsearch
set laststatus=2 "always display statusline
set splitright
set mouse=a "adds mouse click
set noshowmode
set ttimeoutlen=100

"==========LEADER=========================
"leader key is ,
:let mapleader = "-"          
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>su O<Esc>j
nnoremap <leader>tb =i{
nnoremap <leader>ta gg=G

"==========MAP=====================
map <S-d> di
map <C-f> :NERDTreeToggle<CR>
map <C-t> :tabnew 

"sw stands for surround word and sl stands for surround line. Short commands for surround plugin.
"Type what you want after to sorround word/line
map sw ysiw
map sl yss

"copy/paste to system clipboard
map <C-c> "+y
map <C-v> "+p

"remap save on ctrl+s
:nmap <C-s> :w<CR>
:imap <C-s> <Esc>:w<CR>a
:nmap <C-q> :q<CR>
:imap <C-q> <Esc>:q<CR>

"trying to learn those fucking hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Disable ex mode 
nnoremap Q <Nop>

"allow esc on terminal window
tnoremap <Esc> <C-\><C-n>

"move easily between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=======START VIM-PLUG SECTION=======
call plug#begin('~/.vim/plugged')
"======THEMES========================
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'kaicataldo/material.vim'
"======OTHER PLUGINS=================
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'amcsi/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'dhruvasagar/vim-zoom'
call plug#end()

"=======APPEARENCE SECTIONS=========

"neodark theme setup
"let g:neodark#terminal_transparent = 1 " default: 0
"colorscheme neodark

"One half dark theme setup
colorscheme material "onehalfdark
highlight Comment cterm=italic

"=======LIGHTLINE SETTINGS==========
let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
