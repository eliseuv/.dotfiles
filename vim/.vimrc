set nocompatible    " Disable vi compatibility
syntax on           " Syntax highlighting
syntax enable
set number          " Number lines
set cursorline      " Highlight current line
set showmatch       " Show matching
set ignorecase      " Case insensitive
set hlsearch        " Highlight search
set incsearch       " Incremental search
set wildmode=longest,list   " Bash-like tab completions
set clipboard+=unnamedplus  " Use system clipboard
set tabstop=4       " Number of columns occupied by a tab
set shiftwidth=4    " Width for autoindent
set softtabstop=4
set expandtab       " Convert tab to white spaces
set autoindent      " Indent new line the same as the previous
filetype plugin indent on   " Allow autoindent depending on file type
filetype plugin on 
set mouse=v         " Middle-click to paste
set mouse=a         " Enable mouse clicking

" Backup and swap
set backupdir=~/.cache/vim/backup
set noswapfile

" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Call Vim Plug
call plug#begin('~/.vim/plugged')

" Sensible defaults for vim
if !has('nvim')
   Plug 'tpope/vim-sensible'
endif

" Start screen
Plug 'mhinz/vim-startify'

" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets engine
Plug 'SirVer/ultisnips'
" Snippets collection
Plug 'honza/vim-snippets'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Gutter
Plug 'airblade/vim-gitgutter'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Icons NERDTree, vim-airline, etc.
Plug 'ryanoasis/vim-devicons'

" Color Theme
Plug 'tomasiser/vim-code-dark'

" VimTeX
Plug 'lervag/vimtex'

call plug#end()

" CoC extensions
let g:coc_global_extensions = [ 'coc-marketplace', 'coc-calc', 'coc-clangd', 'coc-fzf-preview', 'coc-git', 'coc-json', 'coc-julia', 'coc-highlight', 'coc-lists', 'coc-prettier', 'coc-pyright', 'coc-rust-analyzer', 'coc-snippets', 'coc-sumneko-lua', 'coc-sh']

" Theme
colorscheme codedark
set background=dark
let g:airline_theme = 'codedark'
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
