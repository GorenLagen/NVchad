require("leap").opts.highlight_unlabeled_phase_one_targets = true

-- Настройка цветов с использованием highlight groups
vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#666666" })           -- Цвет для затемнённого текста
vim.api.nvim_set_hl(0, "LeapMatch", { fg = "#9EFD38", bold = true }) -- Цвет совпадений

-- Настройка клавиш
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')

-- Остальный настройки
require("leap").opts.substitute_chars = { [" "] = "·" } -- Замена пробела на точку

-- Хак для русской раскладки
-- require("leap.util")["get-input"] = function()
--     local ok, ch = pcall(vim.fn.getcharstr)
--     if ok and ch ~= vim.api.nvim_replace_termcodes("<esc>", true, false, true) then
--         return require("langmapper.utils").translate_keycode(ch, "default", "ru")
--     end
-- end
