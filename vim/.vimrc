" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Call Vim Plug
call plug#begin()
" Vim sensible defaults
Plug 'tpope/vim-sensible'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Gutter
Plug 'airblade/vim-gitgutter'

" File tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }

" Color Theme
"Plug 'tomasiser/vim-code-dark'
"Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'arcticicestudio/nord-vim'
"Plug 'skurob/robpur-vim'

Plug 'lervag/vimtex'

call plug#end()

" Theme
colorscheme dracula
set background=dark
let g:airline_theme = 'kolor'

" Syntax highlighting
syntax enable
syntax on

" Case sensitivity
set ignorecase

" Number lines
set number

" Spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Use system clipboard
set clipboard+=unnamedplus

" Open tree
nmap <C-n> :NERDTreeToggle<CR>

" Replace all function
function ReplaceAll()
    " Get current word
    let a = expand('<cword>')
    if empty(a)
        return
    endif
    " Get new word
    let b = input('Replace "' . a . '" by: ')
    if empty(b)
        return
    endif
    " Get current
    let l = line('.')
    " Replace all occurences
    execute '%s/' . a . '/' . b . '/gc'
    " Go back to original line
    execute l
endfunction

nmap <C-n> :call ReplaceAll()<CR>
