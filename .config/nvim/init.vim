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
