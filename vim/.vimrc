set nocompatible    " Disable vi compatibility
syntax on           " Syntax highlighting
syntax enable
set number          " Number lines
set cursorline      " Highlight current line
set showmatch       " Highlight matching braces
set showcmd         " Show command in bottom bar
set wildmenu        " Visual autocomplete for command menu
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

" Use true color
set termguicolors
" xterm-true-color fix for vim (https://stackoverflow.com/a/62703167)
if !has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Use ripgrep as grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start Vim Plug
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

" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Telescope
if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

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
Plug 'joshdick/onedark.vim'

" Language specific
Plug 'rust-lang/rust.vim'           " Rust
Plug 'JuliaEditorSupport/julia-vim' " Julia
Plug 'lervag/vimtex'                " LaTeX

call plug#end()

" CoC extensions
let g:coc_global_extensions = [ 'coc-marketplace', 'coc-calc', 'coc-clangd', 'coc-fzf-preview', 'coc-git', 'coc-json', 'coc-julia', 'coc-highlight', 'coc-lists', 'coc-prettier', 'coc-pyright', 'coc-rust-analyzer', 'coc-snippets', 'coc-sumneko-lua', 'coc-sh']

" Open NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Startify custom header
if !has('nvim')
    let s:startify_ascii_header = [
                \ '██╗   ██╗██╗███╗   ███╗',
                \ '██║   ██║██║████╗ ████║',
                \ '██║   ██║██║██╔████╔██║',
                \ '╚██╗ ██╔╝██║██║╚██╔╝██║',
                \ ' ╚████╔╝ ██║██║ ╚═╝ ██║',
                \ '  ╚═══╝  ╚═╝╚═╝     ╚═╝',
                \ '',
                \]
else
    let s:startify_ascii_header = [
                \ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
                \ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
                \ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
                \ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
                \ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
                \ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
                \ '',
                \]
endif
let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

" Theme
set background=dark
let g:airline_theme='onedark'
let g:onedark_terminal_italics=1    " Support italics
colorscheme onedark

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

" Remove trailing whitespace
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Leverage ripgrep on :Find command
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Key map

" Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "
