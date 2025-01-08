-- TODO:
-- 1. Я гандончик и нужно всегда делать бекапы!!!
-- 2. Решить проблему с дублиноверинем output ячеек
-- 3. Установить otter и квадру(?)
-- 4. Сделать статус бар как у него (tmux) -> https://i.imgur.com/2hncXmb.png


vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
    { silent = true, desc = "Initialize the plugin" })
-- vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>",
-- { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>",
    { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>",
    { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "evaluate visual selection" })

vim.g.molten_image_provider = "image.nvim"
