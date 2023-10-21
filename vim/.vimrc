" default
set nocompatible
set encoding=utf-8
set tags=./.tags;,.tags
set number
set relativenumber
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set hidden
set display=lastline
set ttyfast
set lazyredraw
set splitbelow
set splitright
set cursorline
set wrapscan
set report=0
set synmaxcol=120
set ignorecase

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("%") | exe "normal! g'\"" | endif
endif

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

nnoremap <leader>vv :vs $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>

nnoremap <leader>sl :set list! list?<cr>
nnoremap <leader>sw :set wrap! wrap?<cr>

vnoremap < <gv
vnoremap > >gv

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> j jzz
nnoremap <silent> k kzz

nnoremap <leader>bv :buffers<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>1 :bp<cr>
nnoremap <leader>2 :bn<cr>
nnoremap <leader>3 <c-w><c-w>
nnoremap <leader>4 <c-w><left>
nnoremap <leader>5 <c-w><right>
nnoremap <leader>n :vsp<cr>

" plugin
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'justinmk/vim-dirvish'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-user'
Plug 'lfv89/vim-interestingwords'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'rhysd/vim-clang-format'
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'Yggdroot/LeaderF'
call plug#end()

" airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" asyncrun
let g:asyncrun_open = 20
let g:asyncrun_bell = 1

nnoremap <silent><f10> :call asyncrun#quickfix_toggle(20)<cr>
nnoremap <silent><f9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lpthread<cr>
nnoremap <silent><f8> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"<cr>

" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" alinter
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \   'c': ['gcc', 'cppcheck'],
    \   'cpp': ['g++', 'cppcheck'],
    \}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = '--enable=style'
let g:ale_cpp_cppcheck_options = '--enable=style'
let g:ale_set_balloons = 1

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare

nnoremap <leader>at :ALEToggle<cr>
nnoremap <leader>ad :ALEDetail<cr>

" signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_show_test = 1

nnoremap <leader>df :SignifyDiff<cr>
nnoremap <leader>dh :SignifyToggleHighlight<cr>

" echodoc
let g:echodoc#enable_at_startip = 1
let g:echodoc#type = 'popup'
highlight link EchoDocPopup Pmenu

" leaderf
let g:Lf_stlSeparator = { 'left': '', 'right': '', 'font': ''  }
let g:Lf_RootMarkers = [ '.project', '.root', '.svn', '.git' ]
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_showRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = { 'Function': 0, 'BufTag': 0 }

nnoremap <leader>f :LeaderfSelf<cr>

" nerdtree
let NERDTreeWinPos = 'right'
nnoremap <leader>tr :NERDTreeToggle<cr>

" clang format
autocmd FileType c,cpp vnoremap <leader>f :ClangFormat<cr>

" auto popmenu
let g:apc_enable_ft = { 'c': 1, 'cpp': 1, 'python': 1 }
set cpt=.,k,w,b,t
set completeopt=menu,menuone,noselect
set shortmess+=c

" taglist
nnoremap <leader>tt :TlistToggle<cr>

" cpp enhanced highlight
let c_no_curly_error = 1

" color themes
set bg=dark
colorscheme gruvbox
hi Normal ctermfg=252 ctermbg=none
