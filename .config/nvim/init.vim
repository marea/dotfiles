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
Plug 'neovim/nvim-lspconfig'
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

set guifont="GoMono Nerd Font"

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

"" Neovim 0.5 Native LSP
lua << EOF
local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup{}
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- Set some keybinds conditional on server capabilities
if client.resolved_capabilities.document_formatting then
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
if client.resolved_capabilities.document_range_formatting then
  buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
end

-- Set autocommands conditional on server_capabilities
if client.resolved_capabilities.document_highlight then
  vim.api.nvim_exec([[
  hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  augroup END
  ]], false)
end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
