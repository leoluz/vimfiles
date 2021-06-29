require('leoluz.configs/compe')
require('leoluz.configs/treesitter')
local r = require('leoluz.configs/reload')
local lsp = require('leoluz.configs/lsp')
local M = {}

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    local dump = unpack(objects)
    local fp = io.open('/tmp/neovim.log', 'a+')
    fp:write(dump)
    fp:close()
end

vim.lsp.handlers["textDocument/documentSymbol"] = require'dev2one'.handlers.document_symbol
vim.lsp.handlers["textDocument/references"] = require'dev2one'.handlers.document_references
vim.lsp.handlers["textDocument/implementation"] = require'dev2one'.handlers.document_implementation

M.reload = r.reload
M.auto_format_lsp = lsp.auto_format_lsp
return M
