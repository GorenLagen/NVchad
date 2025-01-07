require "nvchad.options"

local enable_providers = {
    "python3_provider",
    "node_provider",
}

for _, plugin in pairs(enable_providers) do
    vim.g["loaded_" .. plugin] = nil
    vim.cmd("runtime " .. plugin)
end

require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "python", "latex", "markdown" },
}

vim.api.nvim_create_user_command('LEET', function()
    vim.cmd('bufdo bd') -- Закрытие всех буферов
    vim.cmd('Leet')
end, {})

--

require("todo-comments").setup()

local o = vim.o
local g = vim.g

g.python3_host_prog = vim.fn.expand "~/.venv/ML/bin/python3"


o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.relativenumber = true


vim.keymap.set('n', 'q:', '<Nop>')
vim.keymap.set("v", "K", "<nop>", { noremap = true, silent = true })


vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/snippets"

-- g.vim_auto_switch_input_method = true
-- g.vim_default_input_method = "xkb:us::eng"  -- Укажите вашу раскладку по умолчанию
-- g.vim_auto_switch_input_method_cmd = "/usr/bin/ibus engine"
-- g.vim_auto_switch_input_method_switch_cmd = "/usr/bin/ibus engine {im}"

-- --- PYTHON3 --- --

vim.keymap.set('n', '<F4>', ":w <bar> exec '!python3 '.shellescape('%')<CR>")

-- --- DAP --- --

vim.api.nvim_set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>dq", ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
