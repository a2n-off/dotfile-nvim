if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" nvim-lspconfig and cmp-*
" -- Tl,Dr ---
" Quickstart configurations for native LSP and autocompletion w/ cmp
" {{{
Plug 'neovim/nvim-lspconfig' " easy native LSP config
Plug 'hrsh7th/nvim-cmp' " LSP autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" }}}

" treesitter
" -- Tl,Dr ---
" usefull plugin for talking to treesitter
" do other stuff like highlighting based on treesitter
" {{{
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" }}}

" snippet plugin 
" -- Tl,Dr ---
" give some snippet option to the cmp plugin
" {{{
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" }}}

" lspkind-nvim
" -- Tl,Dr ---
" vscode-like pictograms for neovim lsp completion items 
" {{{
Plug 'onsails/lspkind-nvim'
" }}}

" onehalf theme
" {{{
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" }}}

" barbar and dependency
" -- Tl,Dr ---
" give a tabs navbar for each buffer
" {{{
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons' " icons dependency for barbar
" }}}

" vim-commentary
" -- Tl,Dr ---
" comment line w/ gcc
" {{{
Plug 'tpope/vim-commentary'
" }}}

" surround and autopair plugin
" -- Tl,Dr ---
" help to autoclose {}, [], (), if/endif, ...
" {{{
Plug 'tpope/vim-surround' " change surround w/ cs
Plug 'tpope/vim-endwise' " end some stuff like if/endif 
Plug 'windwp/nvim-autopairs' " autopairs auto close () <> {} [] etc...
Plug 'windwp/nvim-ts-autotag' " autopair html tag via treesitter
" }}}

" lualine
" -- Tl,Dr ---
" a simple status bar 
" {{{
Plug 'hoob3rt/lualine.nvim'
" }}}

" telescope & dependency
" -- Tl,Dr ---
" fuzzy finder over list
" {{{
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim' " code dependency
Plug 'nvim-lua/plenary.nvim' " code dependency
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " improve performance
" }}}

" gitsigns
" -- Tl,Dr ---
" give inline blame, line status in gutter, ...
" {{{
Plug 'lewis6991/gitsigns.nvim'
" }}}

call plug#end()
