-- plugins
lvim.plugins = {
  { "github/copilot.vim" },
  {
    "CRAG666/code_runner.nvim",
    config = true
  },
  { "machakann/vim-sandwich" },
  { "nvimdev/lspsaga.nvim" },
  { "suan/vim-instant-markdown" },
  { "uga-rosa/ccc.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "jsborjesson/vim-uppercase-sql" },
  { "preservim/tagbar" },
  { "monaqa/dial.nvim" },
  { "meatballs/notebook.nvim" },
  { "sophacles/vim-processing" }
}

require("code_runner").setup({
  -- put here the commands by filetype
  filetype = {
    c = {
      "cd $dir &&",
      "gcc $fileName -o $fileNameWithoutExt &&",
      "$dir/$fileNameWithoutExt"
    },
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    go = "go run",
    tex = "latexmk -pvc"
  },
})

require("lspsaga").setup({
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    enable = false
  }
})

require("ccc").setup({
  highlighter = {
    auto_enable = true,
    filetypes = {
      "css", "html", "astro", "tsx", "conf", "yml", "ini"
    }
  }
})

require("nvim-ts-autotag").setup()

require("notebook")

-- vim options
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Hide the warning when opening a C file
local original_notify = vim.notify
local function custom_notify(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  original_notify(msg, ...)
end
vim.notify = custom_notify

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.leader = "space"
-- lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["K"] = "<Cmd>Lspsaga hover_doc<CR>"
lvim.keys.insert_mode["<C-j>"] = "<Plug>(skkeleton-toggle)"
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.builtin.which_key.mappings["r"] = {
  name = "Code Runner",
  r = { "<Cmd>RunCode<CR>", "Run" },
  c = { "<Cmd>RunClose<CR>", "Close" }
}
lvim.builtin.which_key.mappings["R"] = {
  "<Cmd>%s/。/．/g<CR> <Cmd>%s/、/，/g<CR>",
  "Replace symbol for TeX"
}
lvim.builtin.which_key.mappings["t"] = { "<cmd>TagbarToggle<CR>", "Tagbar" }
lvim.builtin.which_key.mappings["i"] = { "<cmd>CccPick<CR>", "Color Picker" }
lvim.builtin.which_key.mappings["k"] = {
  name = "LSPsaga",
  k = { "<Cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
  l = { "<Cmd>Lspsaga hover_doc ++keep<CR>", "Hover Doc (Keep)" },
  f = { "<Cmd>Lspsaga lsp_finder<CR>", "Finder" },
  r = { "<Cmd>Lspsaga rename<CR>", "Rename" },
  p = { "<Cmd>Lspsaga rename ++project<CR>", "Rename (Project)" },
  o = { "<Cmd>Lspsaga outline<CR>", "Outline" },
  d = {
    name = "Diagnostics",
    d = { "<Cmd>Lspsaga show_workspace_diagnostics<CR>", "Workspace" },
    b = { "<Cmd>Lspsaga show_buf_diagnostics<CR>", "Buffer" },
    c = { "<Cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor" },
    p = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous" },
    n = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Next" },
  }
}
lvim.builtin.which_key.mappings["W"] = {
  name = "Window resize",
  h = { "<Cmd>vertical resize -5<CR>", "Left" },
  l = { "<Cmd>vertical resize +5<CR>", "Right" },
  k = { "<Cmd>resize -5<CR>", "Up" },
  j = { "<Cmd>resize +5<CR>", "Down" },
}

--theme settings
lvim.colorscheme = "tokyonight"
require("tokyonight").setup({
  style = "moon",
  terminal_colors = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
})

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.dashboard.section.header.val = {
  [[██████╗ ██╗   ██╗███╗   ██╗███████╗██╗   ██╗███╗   ██╗██████╗ ██╗   ██╗███╗   ██╗]],
  [[██╔══██╗██║   ██║████╗  ██║██╔════╝██║   ██║████╗  ██║██╔══██╗██║   ██║████╗  ██║]],
  [[██████╔╝██║   ██║██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██████╔╝██║   ██║██╔██╗ ██║]],
  [[██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██╔══██╗██║   ██║██║╚██╗██║]],
  [[██║  ██║╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║ ╚████║██║  ██║╚██████╔╝██║ ╚████║]],
  [[╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝]],
}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- linter
local linters = require "lvim.lsp.null-ls.linters"

local function is_eslint_config_present()
  -- Check if eslint config file is present in the project root
  local eslintrc = vim.fn.glob('.eslintrc.json')
      or vim.fn.glob('.eslintrc.js')
      or vim.fn.glob('.eslintrc.yml')

  -- Or check if eslint is present in package.json
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
      exe = "eslint",
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "astro" },
    },
  }
end

-- formatter
local formatters = require "lvim.lsp.null-ls.formatters"

local function is_prettier_config_present()
  -- Check if prettier config file is present in the project root
  local prettierrc = vim.fn.glob('.prettierrc')
      or vim.fn.glob('.prettierrc.json')
      or vim.fn.glob('.prettierrc.yaml')
      or vim.fn.glob('.prettierrc.yml')
      or vim.fn.glob('.prettierrc.toml')
      or vim.fn.glob('.prettierrc.js')
      or vim.fn.glob('prettier.config.js')
      or vim.fn.glob('.prettierignore')

  -- Or check if prettier is present in package.json
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
      exe = "prettier",
      filetypes = { "javascript", "typescript", "typescriptreact", "json", "html", "css", "scss", "markdown" },
    },
  }
end
