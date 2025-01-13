return {
    keys = {
        { mode = { "n", "v" }, "<C-s>", function() require("harpoon.mark").add_file() end, desc = "add current file to harpoon menu" },
        {
            mode = { "n", "v" },
            "<C-f>",
            '<cmd>lua require("harpoon.ui").toggle_quick_menu()',
            desc = "open harpoon menu",
        },

        { mode = { "n" },      "<C-h>", function() require("harpoon.ui").nav_file(1) end },
        { mode = { "n" },      "<C-j>", function() require("harpoon.ui").nav_file(2) end },
        { mode = { "n" },      "<C-k>", function() require("harpoon.ui").nav_file(3) end },
        { mode = { "n" },      "<C-l>", function() require("harpoon.ui").nav_file(4) end },
    },
}
