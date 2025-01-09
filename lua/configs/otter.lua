-- otter activate/deactivate
vim.api.nvim_set_keymap('n', '<leader>oa', ':lua require"otter".activate()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>od', ':lua require"otter".deactivate()<cr>', { noremap = true, silent = true })

-- Quarto commands
vim.api.nvim_set_keymap('n', '<leader>qa', ':QuartoActivate<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qp', ':lua require"quarto".quartoPreview()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':lua require"quarto".quartoClosePreview()<cr>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qra', ':QuartoSendAll<cr>', { noremap = true, silent = true })
