-- :fennel:1700825786
local capabilities = (require("cmp_nvim_lsp")).default_capabilities()
local lspconfig = require("lspconfig")
local servers = {"ccls", "rust_analyzer", "pyright", "tsserver"}
for _, server in ipairs(servers) do
  local _1_ = server
  if (_1_ == "ccls") then
    lspconfig[server].setup({init_options = {cache = {directory = ".ccls-cache"}, clang = {extraArgs = {"-std=c11", "-I/home/zm/Development/C/Orange/src/core/include"}}}})
  elseif true then
    local _0 = _1_
    lspconfig[server].setup({capabilities = capabilities})
  else
  end
end
return nil