" The plugin directory
call plug#begin('~/.vim/plugged')

" Plugins for tab-completion
Plug 'ncm2/ncm2'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

" list of plugins
Plug 'junegunn/vim-plug'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'
Plug 'ctrlpvim/ctrlp.vim'


" File navigation
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'

" Themes and visuals
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

let g:solarized_term_colors=256
set bg=light
colorscheme solarized

syntax on

set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set pastetoggle=<F12>
au BufNewFile,BufRead *.cu set ft=cu
set smarttab
set expandtab
set softtabstop=4

" spell checking
" only enable for certain file types
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

" Enable syntax highlighting for CUDA
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

" custom indentation level
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
" do not push comments to beginning of line (Python)
"au! FileType python setl nosmartindent

set csto=1

" auto close NERDTree
let NERDTreeQuitOnOpen=1

" make sure you are in the correct directory

" key mappings
map <C-x> :NERDTreeToggle<CR>

" LaTeX mappings
nnoremap <leader>lc :w<CR>:cd %:p:h<CR>:!latexmk -pdf -interaction=nonstopmode %<CR>
nnoremap <leader>lv :!evince %:r.pdf 2>/dev/null &<CR><CR>
"
" gvim settings
if has("gui_running")
    "set guifont=Source\ Code\ Pro\ Regular\ 11
    "set guifont=Roboto\ Mono\ for\ Powerline\ Regular\ 11
    set guifont=Hack\ 12
endif

set encoding=utf-8


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" Make sure the current directory corresponds to the current file
autocmd BufEnter * lcd %:p:h

" Fixes for tmux
set ttimeoutlen=100
set ttymouse=xterm2
set mouse=a

" Run python code from vim
"nnoremap <buffer> <F9> :!python %<cr>
noremap <F9> :!python %<cr>

" Airline config
let g:airline_powerline_fonts = 1

" Auto-apply vimrc after write
autocmd BufWritePost _vimrc source %

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" nvim-completion manager
" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
