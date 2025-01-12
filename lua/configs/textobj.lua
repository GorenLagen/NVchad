-- lua/config/treesitter_textobjects.lua
require 'nvim-treesitter.configs'.setup {
    textobjects = {
        move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
                ["]b"] = { query = "@block.inner", desc = "next code block" },
            },
            goto_previous_start = {
                ["[b"] = { query = "@block.inner", desc = "previous code block" },
            },
        },
    },
}
