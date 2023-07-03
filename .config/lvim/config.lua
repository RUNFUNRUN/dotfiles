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

require('notebook')

-- vim options
local opts = { noremap = true, silent = true }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
  notify(msg, ...)
end

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.leader = "space"
-- lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["K"] = "<Cmd>Lspsaga hover_doc<CR>"
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.builtin.which_key.mappings["r"] = {
  name = "Code Runner",
  r = { "<cmd>RunCode<CR>", "Run" },
  c = { "<cmd>RunClose<CR>", "Close" }
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
