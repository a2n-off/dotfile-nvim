-- INFO --
-- the following function work only with neovim + 0.7
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
-- the function said : in normal mode, if I do capital K, exec this function, whenever the current buffer

local lspc = require'lspconfig'
local cap = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- change signs on the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- open diag when cursor is in the error line
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- lsp config
vim.diagnostic.config({
  -- virtual_text = {
  --   prefix = '●', -- icon for the inline
  -- },
  virtual_text = false,
  update_in_insert = true -- if true show the diag in insert mode
})

-- each server I want
local servers = {
  ts = lspc.tsserver,
  lua = lspc.sumneko_lua,
  bash = lspc.bashls,
  css = lspc.cssls,
  cssm = lspc.cssmodules_ls,
  eslint = lspc.eslint,
  html = lspc.html,
  php = lspc.phpactor
}

-- keymap function, easy to setup once and use for each server
local function onattach()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- show the definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- go to the definition, ctrl+ t for go back
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0}) -- go to type definition
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- go to implementation
  vim.keymap.set("n", " dj", vim.diagnostic.goto_next, {buffer=0}) -- go to the next
  vim.keymap.set("n", " dk", vim.diagnostic.goto_prev, {buffer=0}) -- go to the previous
  vim.keymap.set("n", " r", vim.lsp.buf.rename, {buffer=0}) -- intelligent rename
end

-- loop on each server and setup the same keymap and capabilities (cmp)
for type, server in pairs(servers) do
  server.setup {
    capabilities = cap,
    on_attach = onattach()
  }
end

