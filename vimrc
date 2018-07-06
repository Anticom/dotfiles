" Make sure you use single quotes
call plug#begin()

" Syntax:
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'
Plug 'leafgarland/typescript-vim'

" Colorschemes:
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Dependencies:
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Tpope:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Conflicts with nerdcommenter
"Plug 'tpope/vim-commentary'

" Git:
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntastic:
Plug 'vim-syntastic/syntastic'
" Plug 'w0rp/ale' " no yacc/bison support (yet) as far as i can tell

" ycm:
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'majutsushi/tagbar'

" airline:
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" scrooloose:
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" snippets:
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" other:
Plug 'mbbill/undotree'
Plug 'chrisbra/Recover.vim'
Plug 'godlygeek/tabular'
"Plug 'mhinz/vim-startify'
" TODO documentation plugin
Plug 'kien/ctrlp.vim'
" Competition for CtrlP
"Plug 'shougo/unite.vim'
"Plug 'junegunn/fzf'
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml'

Plug 'terryma/vim-multiple-cursors'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ekalinin/dockerfile.vim'

" TODO
"Plug 'janko-m/vim-test'

" Webdev:
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Filetype:
Plug 'leafgarland/typescript-vim'

" Debuggers:
Plug 'gilligan/vim-lldb'

" Formatters:
Plug 'chiel92/vim-autoformat'


" Initialize plugin system
call plug#end()


" Native Vim:
set shell=/bin/bash
set encoding=utf-8

set nocompatible
filetype plugin on
" TODO get rid of it
set mouse=a
" Case-insensitivity:
set ignorecase
set infercase
set wildignorecase

set background=dark

" ------------------- REMOTE ---------------------
"  Taken from : https://dougblack.io/words/a-good-vimrc.html

" Colors:
" flazz/vim-volorschemes
colorscheme gruvbox
syntax enable

" Spaces Tabs:
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" UI Config:
"set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Searching:
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Folding:
"set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
" space open/closes folds
"nnoremap <space> za
"set foldmethod=indent   " fold based on indent level

" Leader Shortcuts:
let mapleader=","       " leader is comma

" Turn Off Search Highlight:
nnoremap <leader><space> :nohlsearch<CR>

" Remap JK Keys To Keep Current Line Centered
" nnoremap j jzz
" nnoremap k kzz

" Move To Beginning/End Of Line:
nnoremap B ^
nnoremap E $
" $/^ Doesn't Do Anything:
nnoremap $ <nop>
nnoremap ^ <nop>

" Highlight Last Inserted Text:
nnoremap gV `[v`]

" jk is escape
"inoremap jk <esc>

" leader mappings
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>f :Autoformat<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" -------------- Vanilla Vim --------------
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


" ------------------ MINE -----------------
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

set autoread

" https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
":set nonumber norelativenumber  " turn hybrid line numbers off
":set !number !relativenumber    " toggle hybrid line numbers

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set colorcolumn=80

""" Toggable non-printable characters
" choose one of the following:
"set listchars=tab:→\ ,space:·,precedes:«,extends:»,eol:¶
"set listchars=tab:→\ ,space:␣,extends:…,eol:⏎
set listchars=tab:‣\ ,space:·,precedes:«,extends:»,eol:¬
"set listchars=tab:>-,space:.,precedes:<,extends:>,eol:$
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Splits:
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" ---------------------------- Plugins --------------------------
" Syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GtrlP:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Syntastic:
let g:syntastic_typescript_checkers = ['tslint', 'tsc']

" YCM:
function! s:CustomizeYcmLocationWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
  " Switch back to working window.
  wincmd p
endfunction
autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction
autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()

" UltiSnips:

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Nerdtree:
autocmd StdinReadPre * let s:std_in=1

" ---------------------- AUTOCMDS -----------------------------
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    "            \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter yaml setlocal noexpandtab
    autocmd BufEnter yaml setlocal tabstop=2
    autocmd BufEnter yaml setlocal shiftwidth=2
    autocmd BufEnter yaml setlocal softtabstop=2
augroup END

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

