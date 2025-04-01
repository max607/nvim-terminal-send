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

-- global function
_G.send_to_terminal = require('terminal-send').send_to_terminal

-- key maps
vim.keymap.set('n', '<leader>tf', ':let g:MyTerminal=b:terminal_job_id<cr>', {noremap = true})  -- focus terminal
vim.keymap.set('n', '<leader>ts', ':let &opfunc="v:lua.send_to_terminal"<cr>g@', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>tS', ':let &opfunc="v:lua.send_to_terminal"<cr>g@$', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>tss', ':let &opfunc="v:lua.send_to_terminal"<cr>g@_', {noremap = true, silent = true})
vim.keymap.set('x', '<leader>ts', ':lua send_to_terminal("visual")<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>tr', ':lua send_to_terminal("resend")<cr>', {noremap = true, silent = true})
