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

call plug#end()
