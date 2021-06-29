local ts_utils = require'nvim-treesitter.ts_utils'
local parsers = require'nvim-treesitter.parsers'

local M = {}

local test_cases = [[
(call_expression 
  function: (selector_expression
    operand: (identifier) @testing.T
    (#eq? @testing.T "t")
    field: (field_identifier) @testing.T.Run
    (#eq? @testing.T.Run "Run")
  )
  arguments: (argument_list
    (interpreted_string_literal) @test.name
    (func_literal)
  )
)
]]

function M.get_test_cases()
  --local node = ts_utils.get_node_at_cursor()
  --print("range:",node:range())
  --print("start:",node:start())
  --print("end:",node:end_())
  local lang = parsers.get_buf_lang()
  local parser = parsers.get_parser()
  local root = parser:parse()[1]:root()
  local query = vim.treesitter.parse_query(lang, test_cases)
	for id, node, _ in query:iter_captures(root) do
    print("id:", id, "text:", ts_utils.get_node_text(node)[1])
  end
end

return M
