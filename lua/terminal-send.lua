local function send_to_terminal(t)
  local a, b = '', ''
  if t:match('line') or t:match('char') then
    a,b = '[',']'
  elseif t:match('visual') then
    a,b = '<','>'
  end

  if not t:match('resend') then
    local go_to_a = '`' .. a
    local go_to_b = '`' .. b
    local go_to_end = t:match('line') and go_to_b .. '+' or go_to_b
    local v_select = t:match('line') and 'V' or 'v'
    local yank = '"ty'  -- yank to @t register

    vim.cmd('normal! ' .. go_to_a .. v_select .. go_to_b .. yank .. go_to_end)
  end

  local text = vim.fn.getreg('t')  -- get from register
  if not text:match('\n$') then
    text = text .. '\r'  -- ensure line is executed
  end

  vim.fn.chansend(vim.g.MyTerminal, text)
end

return {
  send_to_terminal = send_to_terminal,
}
