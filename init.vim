" nvim setup " {{{

if !1 | finish | endif " stop loading config if it's on tiny or small
autocmd!
scriptencoding utf-8 " script encoding

filetype plugin indent on " allow auto-indenting depending on file type
syntax on " syntax highlighting
filetype plugin on

" setup the ruby env, because I use rbenv
let g:ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'
set clipboard=unnamedplus " allow the talk between nvim clipboard and linux clipboard - need xclip or equivalent
set nocompatible " disable compatibility to old-time vi
set showmatch " show matching 
set ignorecase " case insensitive 
set mouse=v " middle-click paste with 
set hlsearch " highlight search 
set incsearch " incremental search
set tabstop=2 " number of columns occupied by a tab 
set softtabstop=4 " see multiple spaces as tabstops so <BS> does the right thing
set expandtab " converts tabs to white space
set shiftwidth=2 " width for autoindents
set autoindent " indent a new line the same amount as the line just typed
set relativenumber
set number " add line numbers
set wildmode=longest,list " get bash-like tab completions
set mouse=a " enable mouse click
set ttyfast " Speed up scrolling in Vim
" enable sectionned comment
set foldmethod=marker 
set foldlevel=0
set fileencodings=utf-8,latin
set encoding=UTF-8
set title
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*
set nosc noru nosm
set lazyredraw " don't redraw while executing macro (for performance)
set formatoptions+=r " add * in block comments
set nowrap " no line wrap
set ai si
set backspace=start,eol,indent
" finding files - search down into subfolder
set path+=**
" finding files - ignore this folder
set wildignore+=*/node_modules/*,*/vendor/*

" incremental substitution (neovim)
if has("nvim")
  set inccommand=split
endif

" turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" }}}

" Multi os plug.vim imports " {{{

runtime ./plug.vim

if has("unix")
  let s:uname = system("uname -s")
  
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif

endif

if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim

" }}}

" Force certain file type " {{{

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish
" .conf file
au BufNewFile,BufRead *.conf set filetype=conf

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" }}}

" Theme configuration " {{{

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " colorscheme deep-space
  " let g:airline_theme='deep_space'
  " colorscheme scheakur
  " colorscheme one
  " let g:airline_theme='one'
  " background transparency
  highlight Normal guibg=none
  " highlight NonText guibg=none
endif

" }}}
