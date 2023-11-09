-- plugins
lvim.plugins = {
  { 'github/copilot.vim' },
  {
    'CRAG666/code_runner.nvim',
    config = true
  },
  { 'machakann/vim-sandwich' },
  { 'nvimdev/lspsaga.nvim' },
  { 'suan/vim-instant-markdown' },
  { 'uga-rosa/ccc.nvim' },
  { 'windwp/nvim-ts-autotag' },
  { 'jsborjesson/vim-uppercase-sql' },
  { 'preservim/tagbar' },
  { 'monaqa/dial.nvim' },
  { 'meatballs/notebook.nvim' }
}

require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    c = {
      'cd $dir &&',
      'gcc $fileName -o $fileNameWithoutExt &&',
      '$dir/$fileNameWithoutExt'
    },
    java = {
      'cd $dir &&',
      'javac $fileName &&',
      'java $fileNameWithoutExt'
    },
    python = 'python3',
    typescript = 'deno run',
    rust = {
      'cd $dir &&',
      'rustc $fileName &&',
      '$dir/$fileNameWithoutExt'
    },
    go = 'go run',
    tex = 'latexmk -pvc'
  },
})

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
      'css', 'html', 'astro', 'tsx', 'jsx', 'conf', 'yml', 'ini'
    }
  }
})

require('nvim-ts-autotag').setup()

require('notebook').setup()

require('luasnip').filetype_extend('typescriptreact', { 'html' })

require('luasnip').filetype_extend('javascriptreact', { 'html' })

-- vim options
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- only wsl
-- vim.g.clipboard = {
--   name = 'myClipboard',
--   copy = {
--     ['+'] = 'win32yank.exe -i',
--     ['*'] = 'win32yank.exe -i'
--   },
--   paste = {
--     ['+'] = 'win32yank.exe -o',
--     ['*'] = 'win32yank.exe -o'
--   },
--   cache_enabled = 1
-- }

-- general
lvim.log.level = 'warn'
lvim.format_on_save.enabled = true
lvim.leader = 'space'
-- lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode['<S-l>'] = '<Cmd>BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = '<Cmd>BufferLineCyclePrev<CR>'
lvim.keys.normal_mode['K'] = '<Cmd>Lspsaga hover_doc<CR>'
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.builtin.which_key.mappings['r'] = {
  name = 'Code Runner',
  r = { '<Cmd>RunCode<CR>', 'Run' },
  c = { '<Cmd>RunClose<CR>', 'Close' }
}
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
  [[██████╗ ██╗   ██╗███╗   ██╗███████╗██╗   ██╗███╗   ██╗██████╗ ██╗   ██╗███╗   ██╗]],
  [[██╔══██╗██║   ██║████╗  ██║██╔════╝██║   ██║████╗  ██║██╔══██╗██║   ██║████╗  ██║]],
  [[██████╔╝██║   ██║██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██████╔╝██║   ██║██╔██╗ ██║]],
  [[██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██╔══██╗██║   ██║██║╚██╗██║]],
  [[██║  ██║╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║ ╚████║██║  ██║╚██████╔╝██║ ╚████║]],
  [[╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝]],
}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- python lsp
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'pyright' })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= 'pylsp'
end, lvim.lsp.automatic_configuration.skipped_servers)

-- typescript lsp
-- you must reopen the editor for this to take effect
local ts_lsp;
if vim.fn.glob('package.json') ~= '' then
  ts_lsp = 'tsserver'
  vim.cmd('autocmd bufenter *.ts,*.tsx echo "true"')
else
  ts_lsp = 'denols'
  vim.cmd('autocmd bufenter *.ts,*.tsx echo "false"')
end

vim.cmd('autocmd bufenter *.ts,*.tsx LvimCacheReset')
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'tsserver' })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= ts_lsp
end, lvim.lsp.automatic_configuration.skipped_servers)

local linters = require 'lvim.lsp.null-ls.linters'
local formatters = require 'lvim.lsp.null-ls.formatters'

-- typescript linter
local function is_eslint_config_present()
  local eslintrc = vim.fn.glob('.eslintrc')
      or vim.fn.glob('.eslintrc.json')
      or vim.fn.glob('.eslintrc.js')
      or vim.fn.glob('.eslintrc.cjs')
      or vim.fn.glob('.eslintrc.yml')
      or vim.fn.glob('.eslintrc.yaml')
      or vim.fn.glob('.eslintrcignore')

  local package_json = vim.fn.glob('package.json')
  if package_json ~= '' then
    local content_lines = vim.fn.readfile(package_json)
    local content = table.concat(content_lines) -- Concatenate all lines into a single string
    if string.match(content, '"eslint"') then
      return true
    end
  end

  return eslintrc ~= ''
end

if is_eslint_config_present() then
  linters.setup {
    {
      exe = 'eslint',
      filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'astro' },
    },
  }
end

-- typescript formatter
local function is_prettier_config_present()
  local prettierrc = vim.fn.glob('.prettierrc')
      or vim.fn.glob('.prettierrc.json')
      or vim.fn.glob('.prettierrc.yaml')
      or vim.fn.glob('.prettierrc.yml')
      or vim.fn.glob('.prettierrc.toml')
      or vim.fn.glob('.prettierrc.js')
      or vim.fn.glob('prettier.config.js')
      or vim.fn.glob('.prettierignore')

  local package_json = vim.fn.glob('package.json')
  if package_json ~= '' then
    local content_lines = vim.fn.readfile(package_json)
    local content = table.concat(content_lines) -- Concatenate all lines into a single string
    if string.match(content, '"prettier"') then
      return true
    end
  end

  return prettierrc ~= ''
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

-- Hide the warning when opening a C file
local original_notify = vim.notify
local function custom_notify(msg, ...)
  if msg:match('warning: multiple different client offset_encodings') then
    return
  end
  original_notify(msg, ...)
end
vim.notify = custom_notify
-- plugins
lvim.plugins = {
  { 'github/copilot.vim' },
  {
    'CRAG666/code_runner.nvim',
    config = true
  },
  { 'machakann/vim-sandwich' },
  { 'nvimdev/lspsaga.nvim' },
  { 'suan/vim-instant-markdown' },
  { 'uga-rosa/ccc.nvim' },
  { 'windwp/nvim-ts-autotag' },
  { 'jsborjesson/vim-uppercase-sql' },
  { 'preservim/tagbar' },
  { 'monaqa/dial.nvim' },
  { 'meatballs/notebook.nvim' }
}

require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
    c = {
      'cd $dir &&',
      'gcc $fileName -o $fileNameWithoutExt &&',
      '$dir/$fileNameWithoutExt'
    },
    java = {
      'cd $dir &&',
      'javac $fileName &&',
      'java $fileNameWithoutExt'
    },
    python = 'python3',
    typescript = 'deno run',
    rust = {
      'cd $dir &&',
      'rustc $fileName &&',
      '$dir/$fileNameWithoutExt'
    },
    go = 'go run',
    tex = 'latexmk -pvc'
  },
})

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
      'css', 'html', 'astro', 'tsx', 'jsx', 'conf', 'yml', 'ini'
    }
  }
})

require('nvim-ts-autotag').setup()

require('notebook').setup()

require('luasnip').filetype_extend('typescriptreact', { 'html' })

require('luasnip').filetype_extend('javascriptreact', { 'html' })

-- vim options
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- only wsl
-- vim.g.clipboard = {
--   name = 'myClipboard',
--   copy = {
--     ['+'] = 'win32yank.exe -i',
--     ['*'] = 'win32yank.exe -i'
--   },
--   paste = {
--     ['+'] = 'win32yank.exe -o',
--     ['*'] = 'win32yank.exe -o'
--   },
--   cache_enabled = 1
-- }

-- general
lvim.log.level = 'warn'
lvim.format_on_save.enabled = true
lvim.leader = 'space'
-- lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode['<S-l>'] = '<Cmd>BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = '<Cmd>BufferLineCyclePrev<CR>'
lvim.keys.normal_mode['K'] = '<Cmd>Lspsaga hover_doc<CR>'
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.builtin.which_key.mappings['r'] = {
  name = 'Code Runner',
  r = { '<Cmd>RunCode<CR>', 'Run' },
  c = { '<Cmd>RunClose<CR>', 'Close' }
}
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
  [[██████╗ ██╗   ██╗███╗   ██╗███████╗██╗   ██╗███╗   ██╗██████╗ ██╗   ██╗███╗   ██╗]],
  [[██╔══██╗██║   ██║████╗  ██║██╔════╝██║   ██║████╗  ██║██╔══██╗██║   ██║████╗  ██║]],
  [[██████╔╝██║   ██║██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██████╔╝██║   ██║██╔██╗ ██║]],
  [[██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██╔══██╗██║   ██║██║╚██╗██║]],
  [[██║  ██║╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║ ╚████║██║  ██║╚██████╔╝██║ ╚████║]],
  [[╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝]],
}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- python lsp
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'pyright' })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= 'pylsp'
end, lvim.lsp.automatic_configuration.skipped_servers)

-- typescript lsp
-- you must reopen the editor for this to take effect
local ts_lsp;
if vim.fn.glob('package.json') ~= '' then
  ts_lsp = 'tsserver'
  vim.cmd('autocmd bufenter *.ts,*.tsx echo "true"')
else
  ts_lsp = 'denols'
  vim.cmd('autocmd bufenter *.ts,*.tsx echo "false"')
end

vim.cmd('autocmd bufenter *.ts,*.tsx LvimCacheReset')
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'tsserver' })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= ts_lsp
end, lvim.lsp.automatic_configuration.skipped_servers)

local linters = require 'lvim.lsp.null-ls.linters'
local formatters = require 'lvim.lsp.null-ls.formatters'

-- typescript linter
local function is_eslint_config_present()
  local eslintrc = vim.fn.glob('.eslintrc')
      or vim.fn.glob('.eslintrc.json')
      or vim.fn.glob('.eslintrc.js')
      or vim.fn.glob('.eslintrc.cjs')
      or vim.fn.glob('.eslintrc.yml')
      or vim.fn.glob('.eslintrc.yaml')
      or vim.fn.glob('.eslintrcignore')

  local package_json = vim.fn.glob('package.json')
  if package_json ~= '' then
    local content_lines = vim.fn.readfile(package_json)
    local content = table.concat(content_lines) -- Concatenate all lines into a single string
    if string.match(content, '"eslint"') then
      return true
    end
  end

  return eslintrc ~= ''
end

if is_eslint_config_present() then
  linters.setup {
    {
      exe = 'eslint',
      filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'astro' },
    },
  }
end

-- typescript formatter
local function is_prettier_config_present()
  local prettierrc = vim.fn.glob('.prettierrc')
      or vim.fn.glob('.prettierrc.json')
      or vim.fn.glob('.prettierrc.yaml')
      or vim.fn.glob('.prettierrc.yml')
      or vim.fn.glob('.prettierrc.toml')
      or vim.fn.glob('.prettierrc.js')
      or vim.fn.glob('prettier.config.js')
      or vim.fn.glob('.prettierignore')

  local package_json = vim.fn.glob('package.json')
  if package_json ~= '' then
    local content_lines = vim.fn.readfile(package_json)
    local content = table.concat(content_lines) -- Concatenate all lines into a single string
    if string.match(content, '"prettier"') then
      return true
    end
  end

  return prettierrc ~= ''
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

-- Hide the warning when opening a C file
local original_notify = vim.notify
local function custom_notify(msg, ...)
  if msg:match('warning: multiple different client offset_encodings') then
    return
  end
  original_notify(msg, ...)
end
vim.notify = custom_notify
