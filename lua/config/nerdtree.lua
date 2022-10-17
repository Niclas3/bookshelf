local tools = require("utils")
local M = {}
function M.setup()
    tools.nnoremap('<leader>f', ':NERDTreeToggle<CR>')
end

return M
