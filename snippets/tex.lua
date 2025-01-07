local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local rec_ls

rec_ls = function()
    return sn(nil, {
        c(1, {
            -- important!! Having the sn(...) as the first choice will cause infinite recursion.
            t({ "" }),
            -- The same dynamicNode as in the snippet (also note: self reference).
            sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
        }),
    });
end


local table_node
table_node = function(args)
    local tabs = {}
    local count
    table = args[1][1]:gsub("%s", ""):gsub("|", "")
    count = table:len()
    for j = 1, count do
        local iNode
        iNode = i(j)
        tabs[2 * j - 1] = iNode
        if j ~= count then
            tabs[2 * j] = t " & "
        end
    end
    return sn(nil, tabs)
end

local rec_table
rec_table = function()
    return sn(nil, {
        c(1, {
            t({ "" }),
            sn(nil, { t { "\\\\", "" }, d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) })
        }),
    });
end

return {
    s("table", {
        t "\\begin{tabular}{",
        i(1, "0"),
        t { "}", "" },
        d(2, table_node, { 1 }, {}),
        d(3, rec_table, { 1 }),
        t { "", "\\end{tabular}" }
    }),
    s("ls", {
        t({ "\\begin{itemize}",
            "\t\\item " }), i(1), d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }), i(0)
    }) }
