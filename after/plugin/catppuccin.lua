local catppuccin = require("catppuccin")

catppuccin.setup({transparent_background = false})

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
