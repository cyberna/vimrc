syntax on
set number
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent
let &t_SI = "\e[6 q"  " Вертикальный курсор в режиме вставки
let &t_EI = "\e[2 q"  " Блочный курсор в нормальном режиме
"let &t_RI = "\e[4 q"  " Подчеркивающий курсор в режиме замены

call plug#begin('~/.vim/plugged')

  "Vim-live-server
  Plug 'https://github.com/wolandark/vim-live-server.git'
  "Color theme dracula
  Plug 'dracula/vim', {'as': 'dracula'}
  "Coc.nvim autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Emmet
  Plug 'mattn/emmet-vim'
  "Vim-closetag
  Plug 'alvan/vim-closetag'
  "Vim-airline StatusLine
  Plug 'vim-airline/vim-airline'

call plug#end()

set termguicolors
set t_Co=256
colorscheme dracula


let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

