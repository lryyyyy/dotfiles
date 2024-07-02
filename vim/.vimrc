" BASIC ------------------------------------------------------------ {{{
syntax on
filetype on
filetype plugin on
filetype indent on
set nocompatible
set number
set relativenumber
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

inoremap jj <esc>
inoremap kk <esc>

nnoremap o o<esc>
nnoremap O O<esc>

nnoremap <silent><leader>w :w<cr>
nnoremap <silent><leader>q :q!<cr>
nnoremap <silent><leader>vv :vsp $MYVIMRC<cr>
nnoremap <silent><leader>vr :source $MYVIMRC<cr>

nnoremap `<up> <c-w>k
nnoremap `<down> <c-w>j
nnoremap `<left> <c-w>h
nnoremap `<right> <c-w>l

nnoremap j jzz
nnoremap k kzz
nnoremap n nzz
nnoremap N Nzz

nnoremap <silent><leader>e :NERDTreeToggle<cr>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

