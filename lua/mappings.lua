require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
-- local quarto = require "quarto"
-- local runner = require "quarto.runner"

-- general
map("v", "p", "P", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })

-- leap for ru
map({ "n", "x", "o" }, "ы", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "Ы", "<Plug>(leap-backward)")

-- quarto
-- map("n", "<leader>qp", quarto.quartoPreview, { silent = true, noremap = true })
--
-- map("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
-- map("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
-- map("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
