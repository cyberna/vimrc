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
 "Emmet
 Plug 'mattn/emmet-vim'

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

"Настройки Emmet
let g:user_emmet_leader_key = '<C-y>' " Горячая клавиша (Ctrl+y)
let g:user_emmet_settings = {
\ 'html': {
\   'snippets': {
\     'myhtml': "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n\t<meta charset=\"UTF-8\">\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\t<link rel=\"stylesheet\" href=\"/style.css\">\n\t<title>${1:Title}</title>\n</head>\n<body>\n\t${0}\n\t<script></script>\n</body>\n</html>",
\   }
\ }
\}

" Настройка Treesitter (Подсветка синтаксиса)
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "typescript", "python" },
  highlight = { enable = true },
}
EOF

set cursorline
