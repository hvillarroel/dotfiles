
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
Plug 'Xuyuanp/nerdtree-git-plugin'

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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


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


" let g:fzf_preview_window = ['right:50%', 'ctrl-p']


command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


map <C-p> :Files<CR>
map <Leader>nt :NERDTreeFind<CR>


map tn :bn<CR>
map tb :bp<CR>
map td :bd<CR>


let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-S-Right> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


let g:tmux_navigator_save_on_switch = 2


"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'

let g:copilot_node_command = "$NODE_16"

