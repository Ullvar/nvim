function InsertDateTime()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local datetime = os.date("%d.%m.%Y %H:%M")
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { datetime })
end
