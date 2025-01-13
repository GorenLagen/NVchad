require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- general
map("v", "p", "P", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })
