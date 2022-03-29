set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
"set noshowmode

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" File Search
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ctrlpvim/ctrlp.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
" Plug 'scrooloose/neerdcommebter'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe'

" Tree
Plug 'scrooloose/nerdtree'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Autocomplete
":wqPlug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status Bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

colorscheme dracula

" Mapleader
let mapleader=" "


" Split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><


" nmap EasyMotion
nmap <Leader>s <Plug>(easymotion-s2)

" ========= Begin NerdTree ==========
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" Open NerdTree by Default
autocmd VimEnter ~/DEV/* NERDTree

" Focus Editor
autocmd VimEnter * wincmd p

" AutoClose NerdTree, When the last file on the buffer is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap keys for gotos
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>

" Ignore
let g:NERDTreeIgnore = ['node_modules', '.git']

" ========== End NerdTree ==========


" ========= Begin nerdtree-git-plugin ==========

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ========== End nerdtree-git-plugin ==========

" ========= Begin nerdtree-git-plugin ==========
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
" ========== End nerdtree-git-plugin ==========

" ========= Begin Airline ==========
let g:airline_powerline_fonts = 1

" ========== End Airline ==========

" ========= Begin FZF ==========
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       "Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'                                           "Ignore node_modules
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

nnoremap <leader>. :CtrlPTag<cr>

" ========== End FZF ==========

" ========= Begin FZF ==========

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 20
endfunction
nmap <Leader>r :call OpenTerminal()<CR>
" ========== End FZF ==========

" ========= Begin nerdtree-git-plugin ==========
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <Leader>pp :Prettier<CR>
" ========== End FZF ==========

" nmap save and quit
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qa :qall<CR>


