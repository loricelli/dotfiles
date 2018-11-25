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
set encoding=UTF-8
set tags=tags
"==========LEADER=========================
"leader key is ,
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>su O<Esc>j
nnoremap <leader>ib =i{
nnoremap <leader>ia gg=G
"open 10 line terminal below
:nnoremap <leader>o :below 10sp term://$SHELL<cr>i

"==========MAP=====================
map <S-d> di
map <C-f> :NERDTreeToggle<CR>
":NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
map <C-t> :TagbarToggle<CR>

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
"noremap Q <Nop>
":command Q q
"allow esc on terminal window
tnoremap <Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>

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
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
call plug#end()

"=======APPEARENCE SECTIONS=========

"neodark theme setup
"let g:neodark#terminal_transparent = 1 " default: 0
"colorscheme neodark

"One half dark theme setup
colorscheme material "onehalfdark
highlight Comment cterm=italic
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = -1
"=======LIGHTLINE SETTINGS==========
let g:lightline = {
            \ 'colorscheme': 'material_vim',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch','readonly', 'filename', 'modified']],
            \   'right': [[ 'lineinfo'] ,
            \            ['filetype','currenttime']]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'LightlineFugitive',
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \   'filename': 'FilenameForLightline',
            \   'currenttime': 'DisplayCurrentTime'
            \ },
            \ }

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! FilenameForLightline()
    return expand('%')
endfunction


function! DisplayCurrentTime()
    return strftime("%d/%m/%y %H:%M")
endfunction
let g:lightline.subseparator = {
            \   'left': '', 'right': '' 
            \}
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction
