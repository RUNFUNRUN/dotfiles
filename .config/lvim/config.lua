-- plugins
lvim.plugins = {
  { 'github/copilot.vim' },
  { 'machakann/vim-sandwich' },
  { 'nvimdev/lspsaga.nvim' },
  { 'suan/vim-instant-markdown' },
  { 'uga-rosa/ccc.nvim' },
  { 'windwp/nvim-ts-autotag' },
  { 'jsborjesson/vim-uppercase-sql' },
  { 'preservim/tagbar' },
  {
    'samjwill/nvim-unception',
    lazy = false,
    init = function() vim.g.unception_block_while_host_edits = true end
  },
  { 'vuki656/package-info.nvim' },
  {
    'google/vim-codefmt',
    dependencies = { 'google/vim-maktaba' }
  },
  {
    'google/vim-glaive',
    dependencies = { 'google/vim-maktaba' }
  },
}

require('luasnip').filetype_extend('typescriptreact', { 'html' })
require('luasnip').filetype_extend('javascriptreact', { 'html' })

require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    enable = false
  }
})

require('ccc').setup({
  highlighter = {
    auto_enable = true,
    filetypes = {
      'css', 'html', 'astro', 'tsx', 'jsx', 'conf', 'yml', 'ini', 'lua'
    }
  }
})

require('nvim-ts-autotag').setup()

require('package-info').setup()

-- vim options
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', opts)
vim.keymap.set('n', '+', '<C-a>', opts)
vim.keymap.set('n', '-', '<C-x>', opts)
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', opts)
vim.keymap.set('n', 'sv', '<Cmd>vertical split<CR>', opts)
vim.keymap.set('n', 'sh', '<Cmd>split<CR>', opts)
vim.keymap.set('n', '<Enter>', 'o<Esc>', opts)
vim.keymap.set('n', '<S-Enter>', 'O<Esc>', opts)
vim.keymap.set('n', 's', '<Nop>', opts)
vim.keymap.set('n', 'S', '<Nop>', opts)
vim.api.nvim_set_keymap('n', 'dd', '<Cmd>lua Delete_line()<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

function Delete_line()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, '^%s*$') then
    vim.api.nvim_command('normal! "_dd')
  else
    vim.api.nvim_command('normal! dd')
  end
end

-- only wsl
-- vim.g.clipboard = {
--   name = 'myClipboard',
--   copy = {
--     ['+'] = 'win32yank.exe -i --crlf',
--     ['*'] = 'win32yank.exe -i --crlf'
--   },
--   paste = {
--     ['+'] = 'win32yank.exe -o --lf',
--     ['*'] = 'win32yank.exe -o --lf'
--   },
--   cache_enabled = 1
-- }

-- general
lvim.log.level = 'warn'
lvim.format_on_save.enabled = true
lvim.leader = 'space'
lvim.builtin.lir.show_hidden_files = true
-- lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode['<S-l>'] = '<Cmd>BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = '<Cmd>BufferLineCyclePrev<CR>'
lvim.keys.normal_mode['K'] = '<Cmd>Lspsaga hover_doc<CR>'
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.builtin.which_key.mappings['C'] = { '<cmd>close<CR>', 'Close Window' }
lvim.builtin.which_key.mappings['R'] = {
  '<Cmd>%s/。/．/g<CR> <Cmd>%s/、/，/g<CR> <Cmd>noh<CR>',
  'Replace symbol for TeX'
}
lvim.builtin.which_key.mappings['t'] = { '<cmd>TagbarToggle<CR>', 'Tagbar' }
lvim.builtin.which_key.mappings['i'] = { '<cmd>CccPick<CR>', 'Color Picker' }
lvim.builtin.which_key.mappings['k'] = {
  name = 'LSPsaga',
  k = { '<Cmd>Lspsaga hover_doc<CR>', 'Hover Doc' },
  l = { '<Cmd>Lspsaga hover_doc ++keep<CR>', 'Hover Doc (Keep)' },
  f = { '<Cmd>Lspsaga finder<CR>', 'Finder' },
  r = { '<Cmd>Lspsaga rename<CR>', 'Rename' },
  p = { '<Cmd>Lspsaga rename ++project<CR>', 'Rename (Project)' },
  o = { '<Cmd>Lspsaga outline<CR>', 'Outline' },
  d = {
    name = 'Diagnostics',
    d = { '<Cmd>Lspsaga show_workspace_diagnostics<CR>', 'Workspace' },
    b = { '<Cmd>Lspsaga show_buf_diagnostics<CR>', 'Buffer' },
    c = { '<Cmd>Lspsaga show_cursor_diagnostics<CR>', 'Cursor' },
    p = { '<Cmd>Lspsaga diagnostic_jump_prev<CR>', 'Previous' },
    n = { '<Cmd>Lspsaga diagnostic_jump_next<CR>', 'Next' },
  }
}
lvim.builtin.which_key.mappings['W'] = {
  name = 'Window resize',
  h = { '<Cmd>vertical resize -5<CR>', 'Left' },
  l = { '<Cmd>vertical resize +5<CR>', 'Right' },
  k = { '<Cmd>resize -5<CR>', 'Up' },
  j = { '<Cmd>resize +5<CR>', 'Down' },
}
lvim.builtin.which_key.mappings['n'] = {
  name = 'npm package info',
  s = { "<Cmd>lua require('package-info').show({ force = true })<CR>", 'Show' },
  h = { "<Cmd>lua require('package-info').hide()<CR>", 'Hide' },
  t = { "<Cmd>lua require('package-info').toggle()<CR>", 'Toggle' },
  u = { "<Cmd>lua require('package-info').update()<CR>", 'Update' },
  d = { "<Cmd>lua require('package-info').delete()<CR>", 'Delete' },
  p = { "<Cmd>lua require('package-info').change_version()<CR>", 'Change version' },
  i = { "<Cmd>lua require('package-info').install()<CR>", 'Install' },
}

--theme settings
lvim.colorscheme = 'tokyonight'
require('tokyonight').setup({
  style = 'moon',
  terminal_colors = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
})

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.alpha.dashboard.section.header.val = {
  '██████╗ ██╗   ██╗███╗   ██╗███████╗██╗   ██╗███╗   ██╗██████╗ ██╗   ██╗███╗   ██╗',
  '██╔══██╗██║   ██║████╗  ██║██╔════╝██║   ██║████╗  ██║██╔══██╗██║   ██║████╗  ██║',
  '██████╔╝██║   ██║██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██████╔╝██║   ██║██╔██╗ ██║',
  '██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██╔══██╗██║   ██║██║╚██╗██║',
  '██║  ██║╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║ ╚████║██║  ██║╚██████╔╝██║ ╚████║',
  '╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝',
}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lsp settings
local lspconfig = require('lspconfig')

-- emmet lsp
lspconfig.emmet_ls.setup({
  filetypes = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'astro',
    'svelte',
    'vue',
    'less',
    'sass',
    'scss',
    'pug',
  },
})

-- python lsp
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'pyright' })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= 'pylsp'
end, lvim.lsp.automatic_configuration.skipped_servers)

-- apply mdx filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.mdx",
  command = "set filetype=markdown.mdx",
})

local linters = require 'lvim.lsp.null-ls.linters'
local formatters = require 'lvim.lsp.null-ls.formatters'

local eslint_filename = {
  '.eslintrc',
  '.eslintrc.json',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yml',
  '.eslintrc.yaml',
  'eslint.config.js',
  'eslint.config.cjs',
  'eslint.config.mjs',
}

local function is_eslint_config_present()
  for _, filename in ipairs(eslint_filename) do
    if vim.fn.filereadable(filename) == 1 then
      return true
    end
  end
  return false
end

if is_eslint_config_present() then
  linters.setup {
    {
      exe = 'eslint',
      filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'astro' },
    },
  }
end

local prettier_filename = {
  '.prettierrc',
  '.prettierrc.json',
  '.prettierrc.json5',
  '.prettierrc.yaml',
  '.prettierrc.yml',
  '.prettierrc.toml',
  '.prettierrc.js',
  '.prettierrc.cjs',
  '.prettierrc.mjs',
  'prettier.config.js',
  'prettier.config.cjs',
  'prettier.config.mjs',
}

local function is_prettier_config_present()
  for _, filename in ipairs(prettier_filename) do
    if vim.fn.filereadable(filename) == 1 then
      return true
    end
  end
  return false
end

if is_prettier_config_present() then
  formatters.setup {
    {
      exe = 'prettier',
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'html', 'css', 'scss',
        'markdown' },
    },
  }
end
