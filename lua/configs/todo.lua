return {
    signs = true,      -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
        fix = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "fixme", "bug", "fixit", "issue" }, -- a set of other keywords that all map to this fix keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        todo = { icon = " ", color = "info" },
        hack = { icon = " ", color = "warning" },
        warn = { icon = " ", color = "warning", alt = { "warning", "xxx" } },
        perf = { icon = " ", alt = { "optim", "performance", "optimize" } },
        note = { icon = " ", color = "hint", alt = { "info" } },
        test = { icon = "⏲ ", color = "test", alt = { "testing", "passed", "failed" } },
    },
    gui_style = {
        fg = "none",       -- the gui style to use for the fg highlight group.
        bg = "bold",       -- the gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        multiline = true,                -- enable multine todo comments
        multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(keywords)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- uses treesitter to match keywords in comments only
        max_line_len = 400,              -- ignore lines longer than this
        exclude = {},                    -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
        error = { "diagnosticerror", "errormsg", "#dc2626" },
        warning = { "diagnosticwarn", "warningmsg", "#fbbf24" },
        info = { "diagnosticinfo", "#2563eb" },
        hint = { "diagnostichint", "#10b981" },
        default = { "identifier", "#7c3aed" },
        test = { "identifier", "#ff00ff" }
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (keywords) placeholder
        pattern = [[\b(keywords):]], -- ripgrep regex
        -- pattern = [[\b(keywords)\b]], -- match without the extra colon. you'll likely get false positives
    },

    vim.keymap.set("n", "<leader>to", ":noautocmd TodoTelescope<CR> ")
}
