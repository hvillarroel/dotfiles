
" Commands
runtime commands.vim
runtime options.vim

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'


" Ident Lines
Plug 'Yggdroot/indentLine'

" state line
Plug 'vim-airline/vim-airline'

" Comments
Plug 'tpope/vim-commentary'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" COC config
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Github Copilot
Plug 'github/copilot.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'


call plug#end()

" Mapleader
let mapleader=" "

" Gruvbox config
set background=dark
colorscheme gruvbox

" vim-commentary
nnoremap <space>/ :Commentary<CR> 
vnoremap <space>/ :Commentary<CR> 

" Airline config
let g:airline#extensions#tabline#enabled = 1

" Nerdtree
let NERDTreeQuitOnOpen=0
nnoremap <silent> <C-t> :NERDTreeToggle <CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter ~/DEV/* NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><



