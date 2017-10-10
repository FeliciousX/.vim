" File: `~/.config/nvim/init.vim`
filetype off

" Required for Python on MacOS
"
" brew install python
" brew install python3
" pip2 install neovim --upgrade
" pip3 install neovim --upgrade
"
" brew install neovim

" SECTION DEIN --- {{{
" https://github.com/Shougo/dein.vim
" Installed to ~/.config/nvim/bundle

if &compatible
  set nocompatible " Be iMproved
endif

let dein_path = $HOME . '/.config/nvim'
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(dein_path)
  call dein#begin(dein_path)

  " Let dein manage dein
  " Required:
  call dein#add(dein_path)

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')            " NERD Tree file browser
  call dein#add('Xuyuanp/nerdtree-git-plugin')    " Git support in NERD Tree
  call dein#add('vim-airline/vim-airline')        " Status bar
  call dein#add('vim-airline/vim-airline-themes') " Status bar themes
  call dein#add('tpope/vim-surround')             " Vim bracket/parentheses wrapping
  call dein#add('morhetz/gruvbox')                " gruvbox theme
  call dein#add('cloudhead/neovim-fuzzy')         " Fuzzy search with fzy
  call dein#add('numkil/ag.nvim')                 " the_silver_searcher
  call dein#add('tpope/vim-fugitive')             " Git stuff
  call dein#add('airblade/vim-gitgutter')         " Git annotations
  call dein#add('Valloric/MatchTagAlways')        " HTML tag highlight and jumping
  call dein#add('Shougo/deoplete.nvim')           " Autocomplete
  call dein#add('carlitux/deoplete-ternjs')       " JS autocomplete
  call dein#add('w0rp/ale')                       " Asynchronous Lint Engine
  call dein#add('sheerun/vim-polyglot')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('vim-python/python-syntax')
  call dein#add('luochen1990/rainbow')

  " Syntax support
  call dein#add('rust-lang/rust.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('nikvdp/ejs-syntax')
  call dein#add('keith/rspec.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Automatically install new plugins
if dein#check_install()
  call dein#install()
endif

" }}}

" Required:
filetype plugin indent on
syntax enable

" Color Scheme settings --- {{{
color gruvbox
set background=dark

" }}}

" Basic settings --- {{{
set mouse=a
set incsearch hlsearch
set ignorecase smartcase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

set nowrap

set number
set relativenumber
set numberwidth=2

" Set Clipboard --- {{{
if has('unnamedplus')
    set clipboard=unnamedplus
endif
" }}}

let mapleader = "\\"
let localmapleader = ","

" Setting up vim-airline powerline
let g:airline_powerline_fonts = 1
set laststatus=2
set guifont=Hack

let g:polyglot_disabled = ['javascript', 'javascript.jsx', 'python']  " vim-javascript sucks and conflicts with rainbow
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'eruby' : 1, 'javascript.jsx' : 1 }
let g:jsx_ext_required = 0
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
let g:tern#filetypes = [ 'javascript.jsx', 'jsx' ]

" Set Ack to use Silver Searcher (Ag)
let g:ackprg = 'ag --nogroup --nocolor --column'

" ALE Config --- {{{
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_completion_enabled = 1 " Type all the damn scripts
" }}}

" }}}

" Mappings --- {{{

" Fuzzy Finder with fzy --- {{{
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-s> :FuzzyGrep<CR>
" }}}

" Toggles NERDTree
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-e> :NERDTreeFind<CR>

" ALE Mapping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Exit from insert mode
inoremap jk <esc>

" Allow moving up and down even when word is wrapped
nnoremap j gj
nnoremap k gk

" Move to start or end of line with H and L
nnoremap H 0
nnoremap L $

" Move entire line down with - and up with _
nnoremap _ ddkkp
nnoremap - ddp

" Make current word uppercase
inoremap <leader><c-u> <esc>evbUea
nnoremap <leader><c-u> evbUel

" Edit .vimrc and source
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Cover word with quotation marks in normal mode and visual mode
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" Deleting stuff in/around next/last paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(bvg_<cr>
onoremap al( :<c-u>normal! F)%bvg_<cr>
" Deleting stuff in/around next/last curly bracket
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{bvg_<cr>
onoremap al{ :<c-u>normal! F}%bvg_<cr>
" Deleting stuff in/around next/last square bracket
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap an[ :<c-u>normal! f[bvg_<cr>
onoremap al[ :<c-u>normal! F]%bvg_<cr>

" Autocomplete curly bracket
inoremap {<cr> {<cr>}<Esc>O

" Default search to use 'very magic'
nnoremap / /\v

" Highlights all whitespaces
nnoremap <leader>w /\v +$/<cr>

" Turn off search highlight
nnoremap <leader><space> :setlocal nohlsearch!<cr>

" new tab
nnoremap <C-t> :tabe<cr>
" }}}

function JavascriptOptions()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  call deoplete#enable()
endfunction

autocmd FileType javascript call JavascriptOptions()
autocmd FileType javascript.jsx call JavascriptOptions()
autocmd FileType typescript call JavascriptOptions()

set autoread " trigger filetype checking

