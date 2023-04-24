-- plugins
lvim.plugins = {
  { "github/copilot.vim" },
  { "CRAG666/code_runner.nvim", config = true },
  { "machakann/vim-sandwich" },
  { "preservim/tagbar" },
  { "suan/vim-instant-markdown" },
  { "meatballs/notebook.nvim" },
  { "sophacles/vim-processing" }
}

require('code_runner').setup({
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
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
})

require('notebook')

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
lvim.transparent_window = true

-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.builtin.which_key.mappings["r"] = {
  name = "Code Runner",
  r = { "<cmd>RunCode<CR>", "Run" },
  c = { "<cmd>RunClose<CR>", "Close" }
}
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
