syntax on
set number
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent


call plug#begin('~/.vim/plugged')

  "Vim-live-server
  Plug 'https://github.com/wolandark/vim-live-server.git'
  "Color theme dracula
  Plug 'dracula/vim', {'as': 'dracula'}
  "Coc.nvim autocomplete
  Plug 'neoclide/coc.nvim', {'branche': 'release'}
  "Emmet
  Plug 'mattn/emmet-vim'
  "Vim-closetag
  Plug 'alvan/vim-closetag'

call plug#end()

set termguicolors
colorscheme dracula

set statusline=%f\ %m\ %r\ %=%{getcwd()}
set laststatus=2

highlight StatusLine ctermfg=white ctermbg=blue guifg=white guibg=blue 
highlight StatusLineNC ctermfg=gray ctermbg=darkblue guifg=gray guibg=darkblue  

