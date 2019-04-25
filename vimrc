syntax enable "this enables sintax processing
filetype plugin indent on

"windows auto resize as equal size
autocmd VimResized * wincmd =

"o on line with comment won't generate a commented line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"==============SET=====================
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
set cursorline 
set relativenumber
set nopaste
"allows preview on <leader>s
set inccommand=nosplit
"removes numbers from terminal
autocmd TermOpen * setlocal nonumber norelativenumber
"==========LEADER=========================

let mapleader = "ò"

"leader key is ,
nnoremap <leader><space> :nohlsearch<CR>

"adds space above
nnoremap <leader>su O<Esc>j

"indent all block
nnoremap <leader>ib =i{

"intend all file
nnoremap <leader>ia gg=G 
"open 10 line terminal below
nnoremap <leader>o :vertical sp term://$SHELL<cr>i

"silver surfer on word under cursor
nnoremap <leader>a :Ag <C-r>=expand('<cword>')<CR><CR>

"replace word under cursor with word to insert
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
"==========MAP=====================

"Disable ex mode 
nnoremap Q <Nop>

nnoremap SD :cd %:p:h<CR>
"sw stands for surround word and sl stands for surround line. Short commands for surround plugin.
"Type what you want after to sorround word/line
map sw ysiw
map sl yss

"copy/paste to system clipboard
nnoremap <C-v> "+p

"remap save on ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>

"trying to learn those fucking hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"allow esc on terminal window
tnoremap <Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>

"move easily between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Paste on line below the cursor
nnoremap ,p :pu<CR>

"zi (zoom-in) and zo (zoom-out)
nnoremap zi <C-w><Bar><C-w>_<cr>
nnoremap zo <C-w>=
"=======CUSTOM COMMANDS=======
"replaces all the occurences of src with dest (only exact match)
function! FindAndReplaceExact(src,dest)
    execute ':%s/\<' . a:src . '\>/' . a:dest . '/gc'
endfunction

command -nargs=* Fase call FindAndReplaceExact(<f-args>)

function! FindAndReplace(src,dest)
    execute ':%s/' . a:src . '/' . a:dest . '/gc'
endfunction

command -nargs=* Fas call FindAndReplace(<f-args>)

"=======START VIM-PLUG SECTION=======
call plug#begin('~/.vim/plugged')
"======THEMES========================
"Plug 'KeitaNakamura/neodark.vim'
Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'
"======OTHER PLUGINS=================
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'amcsi/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

"=======APPEARENCE SECTIONS=========
set termguicolors "enables colors
let g:gruvbox_sign_column='dark0_hard'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
set background=dark

colorscheme gruvbox

"=======PLUGIN SETTINGS=============
"FZF settings
nnoremap <C-p> :Files<CR>
nnoremap <C-a> :Ag<CR>
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <leader>h :History<CR>
autocmd! FileType fzf 
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer> <esc> <c-c>
  aug END
end

"NERDTree settings

"opens nerdtree
map <C-f> :NERDTreeFind<CR>
"removes ? help on nerdtree
let NERDTreeMinimalUI = 1

"=======LIGHTLINE SETTINGS==========
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch','readonly', 'absolutepath', 'modified']],
            \   'right': [ [ 'lineinfo'] ,
            \            [ 'filetype']
            \            ]
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
    if exists('*gitbranch#name')
        let branch = gitbranch#name()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

