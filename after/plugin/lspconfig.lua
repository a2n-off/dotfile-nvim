-- INFO --
-- the following function work only with neovim + 0.7
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
-- the function said : in normal mode, if I do capital K, exec this function, whenever the current buffer

local lspc = require'lspconfig'
local cap = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function onattach()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- show the definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to the definition, ctrl+ t for go back
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to type definition
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- go to implementation
  vim.keymap.set("n", " dj", vim.diagnostic.goto_next, {buffer=0}) -- go to the next
  vim.keymap.set("n", " dk", vim.diagnostic.goto_prev, {buffer=0}) -- go to the previous
  vim.keymap.set("n", " r", vim.lsp.buf.rename, {buffer=0}) -- intelligent rename
end

lspc.tsserver.setup {
  capabilities = cap,
  on_attach = onattach()
}

lspc.sumneko_lua.setup {
  capabilities = cap,
  on_attach = onattach()
}

-- lspc.angularls.setup{}

lspc.bashls.setup{}

lspc.cssls.setup{}

lspc.cssmodules_ls.setup{}

lspc.eslint.setup{}

lspc.html.setup{}

lspc.phpactor.setup{}

