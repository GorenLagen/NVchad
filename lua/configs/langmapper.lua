require("langmapper").automapping { global = true, buffer = true }

local function escape(str)
    -- You need to escape these characters to work correctly
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(ru_shift) .. ';' .. escape(en_shift),
    escape(ru) .. ';' .. escape(en),
}, ',')


require("leap.util")["get-input"] = function()
    local ok, ch = pcall(vim.fn.getcharstr)
    if ok and ch ~= vim.api.nvim_replace_termcodes("<esc>", true, false, true) then
        return require("langmapper.utils").translate_keycode(ch, "default", "ru")
    end
end

vim.keymap.set({ 'n', 'x', 'o' }, 'ы', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'Ы', '<Plug>(leap-backward)')
