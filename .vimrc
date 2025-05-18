filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set number
set cursorline
set cursorcolumn
set foldcolumn=2
set relativenumber

autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal foldmethod=indent

let mapleader="\<space>"
nmap <Leader><Leader> :w<Enter>
nmap <Leader>w :w<Enter>
nmap <Leader>W :wq<Enter>
nmap <Leader>q :q<Enter>
nmap Q :q!<Enter>
nmap X :wq!<Enter>
nmap <Leader>d 0f]hsx<esc>
nmap <Leader>e 0f]hs<space><esc>
syntax on

nnoremap <A-d> <Esc>gt
nnoremap <A-a> <Esc>gT
inoremap <A-d> <Esc>gt
inoremap <A-a> <Esc>gT

nnoremap T :tabnew<Space>


au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>


nnoremap <C-J> :Telescope find_files<cr>
nnoremap <leader>a za
nnoremap <leader><leader> za
nnoremap <leader>j zj
nnoremap <leader>k zk

