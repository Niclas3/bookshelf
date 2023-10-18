local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("C Snippets", { clear = true })
local file_pattern = "*.c"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --
local bochs_breakpoint_fmt = fmt(
    [[
      __asm__ volatile ("xchgw %bx, %bx;");
    ]]
,{})

local asm_fmt = fmt(
    [[
      __asm__ volatile ("{}"
                       : {}
                       : {}
                       : {});
    ]]
,{
    i(1, "xchgw %bx, %bx;"),
    c(2, { i(1, "\"=a\"(__res)"), i(1, "")}),
    c(3, { i(1,""), i(1,"")}),
    c(4, { i(1,""), i(1,"")})
})

local comment_fmt = fmt(
    [[
/**
 * {}
 *
 * @param {} {}
 * @return {}
 *****************************************************************************/
    ]]
,{
    i(1, "Comments write here"),
    i(2, "param write here"),
    i(3, "param Comments write here"),
    i(4, "return Comments write here")
})

local snippet_bochs_breakpoint= s({ trig = "__[asm]?" }, vim.deepcopy(bochs_breakpoint_fmt)) --}}}
local snippet_asm = s({ trig = "__[asm]?" }, vim.deepcopy(asm_fmt)) --}}}
local snippet_comment= s({ trig = "/**" }, vim.deepcopy(comment_fmt)) --}}}
table.insert(snippets, snippet_bochs_breakpoint)
table.insert(snippets, snippet_asm)
table.insert(snippets, snippet_comment)
-- End Refactoring --

return snippets, autosnippets
