" ~/.config/nvim/init.vim

" Source your .vimrc if you have one separate from this config
source ~/.vimrc

" === VIM-PLUG PLUGIN DEFINITIONS ===
" This block *defines* which plugins to download and manages them.
call plug#begin('~/.config/nvim/plugged') " Ensure this path is correct for your plugins

" List your plugins here
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" nvim-treesitter plugin - the 'do' hook will run :TSUpdate automatically after install/update
" IMPORTANT: The 'do' command runs *after* the plugin is installed/updated.
" The plugin itself is loaded by plug#end()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'deoplete-plugins/deoplete-jedi'
" The File Explorer
Plug 'nvim-tree/nvim-tree.lua'

" Icons (Recommended) - requires a Nerd Font installed on your system
Plug 'nvim-tree/nvim-web-devicons'


Plug 'stevearc/aerial.nvim'

call plug#end()
" === END VIM-PLUG PLUGIN DEFINITIONS ===


" --- General Neovim Settings ---
" Set a colorscheme (optional, but essential for visible highlighting)
colorscheme default " Or your preferred colorscheme, e.g., 'solarized'

" Regarding colors:
" 'set notermguicolors' disables true color support.
" For the best visual experience with nvim-treesitter, 'termguicolors' is recommended.
" If your terminal supports true colors, consider changing this:
set termguicolors
set clipboard=unnamedplus

" --- Ensure core syntax and filetype settings are enabled ---
" These are standard Vim/Neovim settings for basic highlighting and filetype detection
" Place these *before* your Lua configuration if the Lua config depends on these settings.
syntax enable
filetype plugin indent on
set relativenumber


" === PLUGIN CONFIGURATIONS (LUA) ===
" This block *configures* the plugins after they have been loaded by Vim-Plug.
if has('nvim')
  lua << EOF
    require('nvim-treesitter.configs').setup({
      -- List of parser names to install.
      -- "markdown" and "markdown_inline" are crucial for comprehensive Markdown highlighting.
      ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "html", "css", "json", "yaml",
        "python", "go", "rust",
        "markdown",           -- Basic Markdown structure highlighting
        "markdown_inline"     -- Inline Markdown elements (bold, italic, links)
      },

      -- Automatically install missing parsers when entering a buffer
      auto_install = true,

      -- Enable syntax highlighting based on treesitter
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Enable indentation based on treesitter
      indent = { enable = true },
    })
EOF
endif
" === END PLUGIN CONFIGURATIONS ===
"
" " --- NvimTree Setup Start ---
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
" --- NvimTree Setup End ---
"
"


lua << EOF
require('aerial').setup({
  backends = { "treesitter", "markdown", "lsp" },
  
  -- This is the setting you are looking for:
  -- It jumps to the symbol as soon as you move the cursor in the sidebar
  autojump = true,

  layout = {
    max_width = { 40, 0.2 },
    default_direction = "right",
  },
  
  -- Optional: If you want the sidebar to stay open after you jump
  close_on_select = true,
})
EOF
