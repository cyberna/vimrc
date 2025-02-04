" Базовая настройка
set number
syntax on

" Табуляция
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set termguicolors

call plug#begin('~/.config/nvim/plugged')

 " Цветовая тема dracula
 Plug 'dracula/vim', { 'as': 'dracula' }

 " Подсветка синтаксиса
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Улучшение подсветки

 " Запуск сервера vim-live-server
 Plug 'wolandark/vim-live-server'

 " Автодополнение
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme dracula

" Настройки CoC
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-json'
\ ]

" Настройка Treesitter (Подсветка синтаксиса)
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "typescript", "python" },
  highlight = { enable = true },
}
EOF

set cursorline
