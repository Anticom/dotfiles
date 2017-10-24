" Make sure you use single quotes
call plug#begin()

" guide
Plug 'sjl/gundo.vim'

" Mine:
" colorschemes:
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" dependencies
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" common:
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'

" tpope:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Conflicts with nerdcommenter
"Plug 'tpope/vim-commentary'

" syntastic:
Plug 'vim-syntastic/syntastic'
Plug 'feross/standard'
Plug 'leafgarland/typescript-vim'

" ycm:
Plug 'valloric/youcompleteme', { 'do': './install.py' }

Plug 'majutsushi/tagbar'

" airline:
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" scrooloose:
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" other:
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
" TODO documentation plugin
Plug 'kien/ctrlp.vim'
" Competition for CtrlP
"Plug 'shougo/unite.vim'
"Plug 'junegunn/fzf'
"
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'

" TODO
"Plug 'janko-m/vim-test'

" webdev:
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Filetype:
Plug 'leafgarland/typescript-vim'


" Initialize plugin system
call plug#end()


" Native vim:
set shell=/bin/bash
set encoding=utf-8

set nocompatible
filetype plugin on
" TODO get rid of it
set mouse=a
" case-insensitivity
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

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding:
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","       " leader is comma

" jk is escape
"inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>



" ------------------ MINE -----------------
" https://jeffkreeftmeijer.com/vim-number/
:set number relativenumber
":set nonumber norelativenumber  " turn hybrid line numbers off
":set !number !relativenumber    " toggle hybrid line numbers

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" ---
set colorcolumn=80

" Splits:
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Nerdtree:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | Startify | endif

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

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
