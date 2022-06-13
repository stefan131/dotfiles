set nocompatible

filetype plugin indent on

if (has("termguicolors"))
  set termguicolors
endif

" Show line numbers
set number

" Show file stats
set ruler

" Show file in title bar
set title

" Show commands as you type them
set showcmd

" Blink cursor on error instead of beeping
set visualbell

" Default encoding
set encoding=utf-8

" Read filechanges that happen outside of vim
set autoread

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use smart tabs
set smarttab

" Favor spaces over tabs
set expandtab

" Use two spaces for a tab
set shiftwidth=2
set tabstop=2

" Use system clipboard
set clipboard=unnamed

" Disable wrapping for long lines
set nowrap

" Keep a few lines above and below current line
set scrolloff=4

" Keep a few characters visible to the left/right of the cursor
set sidescrolloff=4

" Scroll left/right one character at a time
set sidescroll=1

" Always create equally sized splits
set equalalways

" Faster rendering
set ttyfast

" Always show a status bar
set laststatus=2

" Enhanced command line completion
set wildmenu
set wildmode=longest:full,full

" Allow the usage of multiple buffers
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Highlight searches
set hlsearch

" Highlight search results during typing
set incsearch

" Reduce timeout when hitting the esc key
set timeoutlen=1000 ttimeoutlen=0

" Fire CursorHold event more often, used by vim-signify
set updatetime=100

" Always display the sign column
set signcolumn=yes

" Move cursor to split window
set splitbelow splitright

" Enable spellchecking
set spell spelllang=en,nl

" Enable folding based on syntax
set foldmethod=indent
set foldlevel=999
set nofoldenable

" Don't redraw when executing macros
set lazyredraw

" Delete comment character when joining commented lines
set formatoptions+=j

" Keep 1000 lines of command history
set history=1000

" Assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" Don't include newline characters in visual mode
set selection=old

" Prefer persistent undo over swap files
set undodir=~/.vim/undo
set undofile
set noswapfile

" Automatically equalise splits when Vim is resized
autocmd VimResized * wincmd =

" Make Y behave like C and D
nnoremap Y y$

" Allow for some common typo's
command! W :w
command! Q :q

" Disable Ex mode
nnoremap Q <nop>

" set <space> as the leader for mappings
let mapleader=' '
nnoremap <space> <nop>

" Turn off search highlighting until the next search
nnoremap <leader>l :nohlsearch<CR>

" Indent without losing selection
xnoremap < <gv
xnoremap > >gv

" Mappings for fzf.vim
nnoremap <silent> <leader>jf :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent> <leader>jaf :Files<CR>
nnoremap <silent> <leader>jsf :GFiles?<CR>
nnoremap <silent> <Leader>jd :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>jad :Rg<CR>
nnoremap <silent> <Leader>jh :History<CR>

" Exclude filenames from Rg searches
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Mappings for Signify
nnoremap <leader>gd :SignifyDiff<CR>
nnoremap <leader>gp :SignifyHunkDiff<CR>
nnoremap <leader>gu :SignifyHunkUndo<CR>

" Copy relative path of current buffer
nnoremap <leader>cf :let @*=expand('%:.')<CR>

" Paste without adding to the register in visual mode
xnoremap <expr>p 'pgv"'.v:register.'y`>'
xnoremap <expr>P 'Pgv"'.v:register.'y`>'

" Toggle spell
nnoremap <leader>ts :set spell!<CR>

" Toggle line indentations
nnoremap <leader>tl :IndentLinesToggle<CR>

" Toggle colorcolumn on and off
function! ToggleColorColumn()
  if !&colorcolumn
    set colorcolumn=80
  else
    set colorcolumn&
  endif
endfunction
nnoremap <leader>tc :call ToggleColorColumn()<CR>

" Signify settings
let g:signify_sign_change = '~'
let g:signify_sign_show_count = 0

" ALE settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint'],
\  'javascript': ['eslint'],
\  'javascriptreact': ['eslint'],
\}

" SuperTab settings
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1

" Airline settings
let g:airline_extensions = []
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = 'line %l/%L - %p%%'
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0

" IndentLine settings
let g:indentLine_enabled = 0

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'yggdroot/indentline'

call plug#end()

syntax on
colorscheme onedark

