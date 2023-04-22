-- plugins
lvim.plugins = {
  { "github/copilot.vim" },
  { "machakann/vim-sandwich" },
  { "preservim/tagbar" },
  { "suan/vim-instant-markdown" },
  { "meatballs/notebook.nvim" },
  { "sophacles/vim-processing" }
}

require('notebook')

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', 'copilot#Accept("")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.leader = "space"
lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.which_key.mappings["t"] = { "<cmd>TagbarToggle<CR>", "Tagbar" }

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
