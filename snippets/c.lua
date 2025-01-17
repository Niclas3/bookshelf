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

-- Function to create snippets with aliases
local function create_snippet(trig, description, template, aliases)
    local cur_snippet = s({trig = trig, name = description, aliases = aliases},
                        vim.deepcopy(template))
    return cur_snippet
end

-- 分组：位操作函数
local bit_operation_snippets = {
    create_snippet(
        "__builtin_clz",
        "Counts leading zeros",
        fmt(
            [[
                __builtin_clz({})
            ]],
            {i(1, "unsigned_int")}
        ),
        {"clz"}
    ),
    create_snippet(
        "__builtin_ctz",
        "Counts trailing zeros",
        fmt(
            [[
                __builtin_ctz({})
            ]],
            {i(1, "unsigned_int")}
        ),
        {"ctz"}
    ),
    create_snippet(
        "__builtin_popcount",
        "Counts 1 bits in an integer",
        fmt(
            [[
                __builtin_popcount({})
            ]],
            {i(1, "unsigned_int")}
        ),
        {"popcount"}
    ),
    create_snippet(
        "__builtin_parity",
        "Computes parity of an integer",
        fmt(
            [[
                __builtin_parity({})
            ]],
            {i(1, "unsigned_int")}
        ),
        {"parity"}
    ),
    create_snippet(
        "__builtin_bswap16",
        "Byte-swap 16-bit integer",
        fmt(
            [[
                __builtin_bswap16({})
            ]],
            {i(1, "unsigned_short")}
        ),
        {"bswap16"}
    ),
    create_snippet(
        "__builtin_bswap32",
        "Byte-swap 32-bit integer",
        fmt(
            [[
                __builtin_bswap32({})
            ]],
            {i(1, "unsigned_int")}
        ),
        {"bswap32"}
    ),
    create_snippet(
        "__builtin_bswap64",
        "Byte-swap 64-bit integer",
        fmt(
            [[
                __builtin_bswap64({})
            ]],
            {i(1, "unsigned_long_long")}
        ),
        {"bswap64"}
    )
}
vim.list_extend(snippets, bit_operation_snippets)

-- 分组：数学函数
local math_snippets = {
    create_snippet(
        "__builtin_sqrt",
        "Square root of x",
        fmt(
            [[
                __builtin_sqrt({})
            ]],
            {i(1, "x")}
        ),
        {"sqrt"}
    ),
    create_snippet(
        "__builtin_pow",
        "x raised to the power y",
        fmt(
            [[
                __builtin_pow({}, {})
            ]],
            {i(1, "base"), i(2, "exponent")}
        ),
        {"pow"}
    ),
    create_snippet(
        "__builtin_copysign",
        "Returns value with the sign of sign",
        fmt(
            [[
                __builtin_copysign({}, {})
            ]],
            {i(1, "value"), i(2, "sign")}
        ),
        {"copysign"}
    )
}
vim.list_extend(snippets, math_snippets)

-- 分组：内存操作函数
local memory_snippets = {
    create_snippet(
        "__builtin_memcpy",
        "Copies memory",
        fmt(
            [[
                __builtin_memcpy({}, {}, {})
            ]],
            {i(1, "destination"), i(2, "source"), i(3, "length")}
        ),
        {"memcpy"}
    ),
    create_snippet(
        "__builtin_memset",
        "Sets memory to value",
        fmt(
            [[
                __builtin_memset({}, {}, {})
            ]],
            {i(1, "destination"), i(2, "value"), i(3, "length")}
        ),
        {"memset"}
    ),
    create_snippet(
        "__builtin_memmove",
        "Moves memory",
        fmt(
            [[
                __builtin_memmove({}, {}, {})
            ]],
            {i(1, "destination"), i(2, "source"), i(3, "length")}
        ),
        {"memmove"}
    )
}
vim.list_extend(snippets, memory_snippets)

-- 分组：原子操作函数
local atomic_snippets = {
    create_snippet(
        "__sync_fetch_and_add",
        "Atomically add value to *ptr",
        fmt(
            [[
                __sync_fetch_and_add({}, {})
            ]],
            {i(1, "ptr"), i(2, "value")}
        ),
        {"fetch_add"}
    ),
    create_snippet(
        "__sync_fetch_and_sub",
        "Atomically subtract value from *ptr",
        fmt(
            [[
                __sync_fetch_and_sub({}, {})
            ]],
            {i(1, "ptr"), i(2, "value")}
        ),
        {"fetch_sub"}
    ),
    create_snippet(
        "__sync_lock_test_and_set",
        "Atomically set *ptr to value and return old value",
        fmt(
            [[
                __sync_lock_test_and_set({}, {})
            ]],
            {i(1, "ptr"), i(2, "value")}
        ),
        {"lock_set"}
    ),
    create_snippet(
        "__sync_bool_compare_and_swap",
        "Atomically compare and swap values",
        fmt(
            [[
                __sync_bool_compare_and_swap({}, {}, {})
            ]],
            {i(1, "ptr"), i(2, "old_value"), i(3, "new_value")}
        ),
        {"compare_swap"}
    )
}
vim.list_extend(snippets, atomic_snippets)

-- 分组：错误检测和缓存操作
local misc_snippets = {
    create_snippet(
        "__builtin_trap",
        "Triggers unrecoverable error",
        fmt(
            [[
                __builtin_trap()
            ]],
            {}
        ),
        {"trap"}
    ),
    create_snippet(
        "__builtin_unreachable",
        "Marks unreachable code",
        fmt(
            [[
                __builtin_unreachable()
            ]],
            {}
        ),
        {"unreachable"}
    ),
    create_snippet(
        "__builtin_assume_aligned",
        "Assumes pointer alignment",
        fmt(
            [[
                __builtin_assume_aligned({}, {})
            ]],
            {i(1, "ptr"), i(2, "alignment")}
        ),
        {"assume_aligned"}
    ),
    create_snippet(
        "__builtin_clear_cache",
        "Clears instruction cache",
        fmt(
            [[
                __builtin_clear_cache({}, {})
            ]],
            {i(1, "begin"), i(2, "end")}
        ),
        {"clear_cache"}
    )
}
vim.list_extend(snippets, misc_snippets)


-- End Refactoring --

return snippets, autosnippets
