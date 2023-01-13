-- require("notify").setup({})
vim.notify = require("notify")
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focus_id = ctx.method
  if not (result and result.contents) then
    -- vim.notify('No information available')
    return
  end
  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    -- vim.notify('No information available')
    return
  end
  return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
end

