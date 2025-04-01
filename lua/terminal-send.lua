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

local function setup()
  -- default mode insert
  vim.api.nvim_create_augroup('term_def_insert', {clear = true})
  vim.api.nvim_create_autocmd({'BufEnter', 'BufNew'}, {
    group = 'term_def_insert',
    pattern = 'term://*',
    command = 'startinsert'
  })

  -- auto cmd for terminal id
  vim.api.nvim_create_augroup('set_my_terminal', {clear = true})
  vim.api.nvim_create_autocmd('TermOpen', {
    group = 'set_my_terminal',
    pattern = '*',
    callback = function()
      vim.g.MyTerminal = vim.b.terminal_job_id
      vim.bo.buflisted = false
    end
  })

  -- key maps
  vim.keymap.set('n', '<leader>tf', ':let g:MyTerminal=b:terminal_job_id<cr>', {noremap = true})  -- focus terminal
  vim.keymap.set('n', '<leader>ts', ':let &opfunc="v:lua.send_to_terminal"<cr>g@', {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>tS', ':let &opfunc="v:lua.send_to_terminal"<cr>g@$', {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>tss', ':let &opfunc="v:lua.send_to_terminal"<cr>g@_', {noremap = true, silent = true})
  vim.keymap.set('x', '<leader>ts', ':lua send_to_terminal("visual")<cr>', {noremap = true, silent = true})
  vim.keymap.set('n', '<leader>tr', ':lua send_to_terminal("resend")<cr>', {noremap = true, silent = true})
end

return {
  setup = setup,
}
