syntax enable "this enables sintax processing
set tabstop=4
set softtabstop=4
set number
set showcmd
filetype indent on
set wildmenu
set showmatch "shows matching parentesis
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
"leader key is \
set foldenable
set laststatus=2
set splitright
nnoremap <leader><right> :tabn<CR>
nnoremap <leader><left> :tabp<CR>
"when working with html with F5 the html is opened on browser
nnoremap <F5> :!xdg-open %<CR><CR>
map <C-f> :NERDTreeToggle<CR>
set mouse=a "adds mouse click
set noshowmode
set ttimeoutlen=50
map <S-d> di
map <S-y> "+y
map <S-p> "+p
"=======START VIM-PLUG SECTION=======
call plug#begin('~/.vim/plugged')
Plug 'KeitaNakamura/neodark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()
"=======END VIM-PLUG SECTION=======
let g:neodark#terminal_transparent = 1 " default: 0
colorscheme neodark
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
"==========END SET COLOR SCHEME AND GIT PLUGIN=========
