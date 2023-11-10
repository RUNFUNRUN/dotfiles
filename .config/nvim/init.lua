-- for VSCode Neovim plugin

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ 'machakann/vim-sandwich' })

vim.opt.clipboard = 'unnamedplus'

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', opts)
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', 'H', '<Cmd>bprevious<CR>', opts)
vim.keymap.set('n', 'L', '<Cmd>bnext<CR>', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', 's', '<Nop>', opts)

if vim.g.vscode then
  vim.keymap.set('i', '<Right>', "<Cmd>call VSCodeCall('editor.action.inlineSuggest.commit')<CR>", opts)
end