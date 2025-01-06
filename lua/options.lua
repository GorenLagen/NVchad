require "nvchad.options"

local enable_providers = {
    "python3_provider",
    "node_provider",
    -- and so on
}

for _, plugin in pairs(enable_providers) do
    vim.g["loaded_" .. plugin] = nil
    vim.cmd("runtime " .. plugin)
end

require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "python", "latex", "markdown" }, -- Добавьте нужные языки
}


vim.keymap.set('n', 'q:', '<Nop>')
require("todo-comments").setup()

-- Импортируем dap
-- local dap = require "dap"
--
-- dap.adapters.python = {
--     type = "executable",
--     command = "python",
--     args = { "-m", "debugpy.adapter" },
-- }
-- -- Настройка конфигурации для Python
-- dap.configurations.python = {
--     {
--         type = "python",
--         request = "launch",
--         name = "Launch Program",
--         program = "${file}",
--     },
-- }
--
-- require("dapui").setup()
-- require("nvim-dap-virtual-text").setup()

-- require("lspconfig").pyright.setup {
--   cmd = {
--     -- "~/.local/share/nvim/mason/bin/pyright-langserver",
--     "--stdio",
--   },
-- }

vim.api.nvim_create_user_command('LEET', function()
    vim.cmd('bufdo bd') -- Закрытие всех буферов
    vim.cmd('Leet')     -- Ваша дополнительная команда Leet
end, {})

-- add yours here!

local o = vim.o
local g = vim.g

--

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.relativenumber = true

g.python3_host_prog = vim.fn.expand "~/.venv/ML/bin/python3"

-- Точки останова
vim.api.nvim_set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })

-- Продолжить выполнение
vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })

-- Шаг через строку
vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })

-- Шаг в функцию
vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })

-- Шаг выход из функции
vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })

-- Открыть REPL
vim.api.nvim_set_keymap("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })

-- Завершить отладку
vim.api.nvim_set_keymap("n", "<Leader>dq", ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true })

-- Открыть интерфейс отладки
vim.api.nvim_set_keymap("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })

vim.lsp.set_log_level "debug"

vim.keymap.set("v", "K", "<nop>", { noremap = true, silent = true })

--g.im_select_command = "C:\\Windows\\System32\\im-select"
-- g.im_select_default = "1033"

-- g.vim_auto_switch_input_method = true
-- g.vim_default_input_method = "xkb:us::eng"  -- Укажите вашу раскладку по умолчанию
-- g.vim_auto_switch_input_method_cmd = "/usr/bin/ibus engine"
-- g.vim_auto_switch_input_method_switch_cmd = "/usr/bin/ibus engine {im}"
