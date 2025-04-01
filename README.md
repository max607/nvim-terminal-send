```lua
-- install package
require('lazy').setup({
    'max607/nvim-terminal-send',
    config = function()
      local terminal_send = require('terminal-send')
      terminal_send.setup()
    end,
})

-- open splits on the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- alt + vim direction split navigation (normal mode)
vim.keymap.set('n', '<M-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<M-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<M-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<M-l>', '<C-w>l', {noremap = true})

-- alt + vim direction split navigation (insert and terminal mode)
vim.keymap.set({'i', 't'}, '<M-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-l>', '<C-\\><C-n><C-w>l', {noremap = true})

-- terminal vi mode -> normal mode
vim.keymap.set('t', '<C-esc>', '<C-\\><C-n>', {noremap = true})

-- open terminal
vim.keymap.set('n', '<leader>tT', ':vsp<bar>vertical resize 85<bar>term<cr><C-w>h', {noremap = true})

-- open terminal with R
vim.keymap.set('n', '<leader>tR', ':vsp<bar>vertical resize 85<bar>term<cr>:set syntax=r<cr>iR<cr><C-l><C-\\><C-n><C-w>h', {noremap = true})

-- open terminal with Python
vim.keymap.set('n', '<leader>tP', ':vsp<bar>vertical resize 85<bar>term<cr>:set syntax=python<cr>isource $(poetry env info --path)/bin/activate && python<cr><C-l><C-\\><C-n><C-w>h', {noremap = true})
```
