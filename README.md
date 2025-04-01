# terminal-send

A minimalist plugin to interact with CLIs of programming languages like `R` and `Python`.

## Usage

This package aims to integrate with the usual vim workflow.
The basic setup is to open, e.g., an `R` script and a nvim terminal running `R` in split view.
Now you can send arbitrary text from the script to the terminal with `<leader>ts` and a *vim motion*.

Additional shortcuts are

* `<leader>tf` for focusing a terminal, e.g., if you use several `R` instances at once.
* `<leader>tr` for re-sending the last code selection.

## Installation

Install using your favorite package manager, e.g. [Lazy](https://github.com/folke/lazy.nvim):

```lua
require('lazy').setup({
    'max607/nvim-terminal-send',
})
```

## Helpful shortcuts

Here are some some shortcuts I recommend for ease of use.

```
-- open splits on the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- alt + "vim direction" split navigation (normal mode)
vim.keymap.set('n', '<M-h>', '<C-w>h', {noremap = true})
vim.keymap.set('n', '<M-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<M-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<M-l>', '<C-w>l', {noremap = true})

-- alt + "vim direction" split navigation (insert and terminal mode)
vim.keymap.set({'i', 't'}, '<M-h>', '<C-\\><C-n><C-w>h', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-j>', '<C-\\><C-n><C-w>j', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-k>', '<C-\\><C-n><C-w>k', {noremap = true})
vim.keymap.set({'i', 't'}, '<M-l>', '<C-\\><C-n><C-w>l', {noremap = true})

-- ctrl + esc for terminal mode -> normal mode
vim.keymap.set('t', '<C-esc>', '<C-\\><C-n>', {noremap = true})

-- open terminal, stay on the script
vim.keymap.set('n', '<leader>tT', ':vsp<bar>vertical resize 85<bar>term<cr><C-w>h', {noremap = true})

-- open terminal with R
vim.keymap.set('n', '<leader>tR', ':vsp<bar>vertical resize 85<bar>term<cr>:set syntax=r<cr>iR<cr><C-l><C-\\><C-n><C-w>h', {noremap = true})

-- open terminal with Python and poetry environment
vim.keymap.set('n', '<leader>tP', ':vsp<bar>vertical resize 85<bar>term<cr>:set syntax=python<cr>isource $(poetry env info --path)/bin/activate && python<cr><C-l><C-\\><C-n><C-w>h', {noremap = true})
```
