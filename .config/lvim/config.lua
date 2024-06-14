-- plugins
lvim.plugins = {
  { 'github/copilot.vim' },
  { 'machakann/vim-sandwich' },
  { 'jsborjesson/vim-uppercase-sql' },
  { 'preservim/tagbar' },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        symbol_in_winbar = {
          enable = false
        },
        lightbulb = {
          enable = false
        },
      })
    end
  },
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup()
    end
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true,
      })
    end
  },
  {
    'vuki656/package-info.nvim',
    config = function()
      require('package-info').setup()
    end
  },
  {
    'MysticalDevil/inlay-hints.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('inlay-hints').setup({
        commands = { enable = true },
        autocmd = { enable = false },
      })
    end
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup()
    end,
  },
  -- discord rich presence check here: https://github.com/andweeb/presence.nvim
  {
    'andweeb/presence.nvim',
    config = function()
      require('presence').setup()
    end
  },
  -- only kitty term check here: https://github.com/3rd/image.nvim
  -- {
  --   'vhyrro/luarocks.nvim',
  --   priority = 1001,
  --   opts = {
  --     rocks = { 'magick' },
  --   },
  -- },
  -- {
  --   '3rd/image.nvim',
  --   dependencies = { 'luarocks.nvim' },
  --   config = function()
  --     require('image').setup()
  --   end
  -- },
}

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
vim.api.nvim_set_keymap('n', 'dd', '<Cmd>lua delete_line()<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

function delete_line()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, '^%s*$') then
    vim.api.nvim_command('normal! "_dd')
  else
    vim.api.nvim_command('normal! dd')
  end
end

-- general
lvim.log.level = 'warn'
lvim.format_on_save.enabled = true
lvim.leader = 'space'
lvim.builtin.lir.show_hidden_files = true

-- lvim keymappings
lvim.keys.normal_mode['<S-l>'] = '<Cmd>BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = '<Cmd>BufferLineCyclePrev<CR>'
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.keys.normal_mode['K'] = '<Cmd>Lspsaga hover_doc<CR>'
lvim.builtin.which_key.mappings['C'] = { '<cmd>close<CR>', 'Close Window' }
lvim.builtin.which_key.mappings['R'] = {
  '<Cmd>%s/。/．/g<CR> <Cmd>%s/、/，/g<CR> <Cmd>noh<CR>',
  'Replace symbol for TeX'
}
lvim.builtin.which_key.mappings['t'] = { '<cmd>TagbarToggle<CR>', 'Tagbar' }
lvim.builtin.which_key.mappings['P'] = { '<cmd>CccPick<CR>', 'Color Picker' }
lvim.builtin.which_key.mappings['i'] = { '<cmd>InlayHintsToggle<CR>', 'Inlay Hints' }
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

-- theme settings
lvim.colorscheme = 'tokyonight'
require('tokyonight').setup({
  style = 'moon',
  terminal_colors = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
})

-- lvin builtin settings
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
lvim.builtin.treesitter.auto_install = true

-- apply mdx filetype
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.mdx',
  command = 'set filetype=markdown.mdx',
})

-- lsp settings
local lspconfig = require('lvim.lsp.manager')

-- set skipped servers
local additional_servers = {
  'lua_ls',
  'tsserver',
  'pyright',
  'rust_analyzer',
  'jdtls',
}

local server_list = vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, additional_servers)
lvim.lsp.automatic_configuration.skipped_servers = server_list

-- lua
lspconfig.setup('lua_ls', {
  settings = {
    Lua = {
      hint = {
        enable = true,
      }
    }
  }
})

-- typescript
local function is_packagejson_present()
  if vim.fn.filereadable('package.json') == 1 then
    return true
  end
  return false
end

if is_packagejson_present() then
  lspconfig.setup('tsserver', {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  })
else
  lspconfig.setup('denols', {
    settings = {
      deno = {
        inlayHints = {
          parameterNames = { enabled = 'all', suppressWhenArgumentMatchesName = true },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enable = true },
          enumMemberValues = { enabled = true },
        },
      }
    }
  })
end

-- emmet
lspconfig.setup('emmet_ls', {
  filetypes = {
    'css',
    'html',
    'javascriptreact',
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

-- biome
local biome_filename = {
  'biome.json',
  'biome.jsonc',
}

local function is_biome_config_present()
  for _, filename in ipairs(biome_filename) do
    if vim.fn.filereadable(filename) == 1 then
      return true
    end
  end
  return false
end

if is_biome_config_present() then
  lspconfig.setup('biome')
end

-- python
lspconfig.setup('pylyzer', {
  settings = {
    python = {
      inlayHints = true
    }
  }
})

-- rust
lspconfig.setup('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = 'never',
        },
        lifetimeElisionHints = {
          enable = 'never',
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = 'never',
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    }
  }
})

-- java
lspconfig.setup('jdtls', {
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = 'all',
          exclusions = { 'this' },
        },
      },
    }
  }
})

-- formatter settings
local formatters = require('lvim.lsp.null-ls.formatters')

-- prettier
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
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'jsonc',
        'html',
        'css',
        'scss',
        'sass',
        'less',
        'astro',
        'vue',
        'markdown',
      },
    },
  }
end

-- linters settings
local linters = require('lvim.lsp.null-ls.linters')

-- eslint
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
      filetypes = {
        'typescript',
        'typescriptreact',
        'javascript',
        'javascriptreact',
        'astro',
        'vue',
      },
    },
  }
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
