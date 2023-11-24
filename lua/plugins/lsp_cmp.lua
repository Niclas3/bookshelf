-- :fennel:1700838630
local cmp_setup = (require("cmp")).setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local function _1_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif luasnip.jumpable(( - 1)) then
    return luasnip.jump(( - 1))
  else
    return fallback()
  end
end
local function _3_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  else
    return fallback()
  end
end
local function _5_(args)
  return luasnip.lsp_expand(args.body)
end
return cmp_setup({mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping.complete(), ["<C-d>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}), ["<S-Tab>"] = cmp.mapping(_1_, {"i", "s"}), ["<Tab>"] = cmp.mapping(_3_, {"i", "s"})}), snippet = {expand = _5_}, sources = {{name = "nvim_lsp"}, {name = "luasnip"}}})