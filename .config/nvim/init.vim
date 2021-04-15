call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'bagrat/vim-buffet'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

colorscheme sayo
set number
set colorcolumn=80
set termguicolors
set list listchars=tab:>-,trail:.,extends:>
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shortmess+=A
set shortmess=atI
set textwidth=80
set updatetime=100
let mapleader=","

" Backup and undo files
if !exists('g:myruntime')
  let g:myruntime = split(&rtp, ',')[0]
endif
let &backupdir = g:myruntime . '/backup'
let &directory = g:myruntime . '/tmp'
let &undodir = g:myruntime . '/undodir'
set backup
set undofile

" Custom Keybindings
imap jk <Esc>
imap kj <Esc>


" Plugin Configuration
"" vim-buffet
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer    gui=NONE guibg=#ffafd7 guifg=#585858
  hi! BuffetActiveBuffer     gui=NONE guibg=#fff0ff guifg=#303030
  hi! BuffetBuffer           gui=NONE guibg=#303030 guifg=#f0f0ff
  hi! BuffetModCurrentBuffer gui=NONE guibg=#ffafd7 guifg=#303030
  hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#303030
  hi! BuffetModBuffer        gui=NONE guibg=#ffaf87 guifg=#303030
  hi! BuffetTrunc            gui=NONE guibg=#bd93f9 guifg=#303030
  hi! BuffetTab              gui=NONE guibg=#ffd7ff guifg=#303030
endfunction

"" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"" Indent Line
let g:indentLine_char = '│'

"" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
