" things to look into



" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.


" fuzzy search
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/opt/fzf'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
" https://github.com/junegunn/fzf/blob/master/README-VIM.md

" file/directory navigator
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" file search
Plug 'rking/ag.vim'

Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ervandew/supertab'

Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'

" linting
Plug 'neomake/neomake'

Plug 'neovimhaskell/haskell-vim'

Plug 'zchee/deoplete-jedi'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'


Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" theme
Plug 'herrbischoff/cobalt2.vim'
Plug 'trevordmiller/nova-vim'
Plug 'jnurmine/Zenburn'

call plug#end()

let mapleader = ";"

" enable syntax highlighting
syntax on

" theme
set t_Co=256
" set background=dark
"colorscheme nova
"colorscheme cobalt2
"colorscheme gruvbox
colorscheme zenburn

"let g:airline_theme = "zenburn"



" close buffer
nnoremap <leader>d :bd<CR>
" close all buffers
nnoremap <leader>D :%bd<CR>

" vert split
nnoremap <leader>v :vs<CR>

"" load plugins
"if filereadable(expand("~/.vimrc.plugins"))
  "source ~/.vimrc.plugins
"endif

" required to detect filetype
filetype plugin indent on

set shell=/bin/bash

" status line
"set statusline=%f\ %=col:%2c\ line:%2l

set backspace=2       " make backspace work like most other apps
set noswapfile        " don't swap buffer to file
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " always display the status line
set history=500       " sets how many lines of history VIM has to remember
set nowrap            " don't wrap long lines
set wildmenu          " visual autocomplete for command menu
set ignorecase        " /the would find 'the' or 'The', add \C if you want 'the' only
set smartcase         " while /The would find only 'The' etc.
set nopaste           " enable formatting while pasting
set pastetoggle=<F2>  " switch paste mode
set clipboard=unnamed " yank to and paste the selection without prepending "*
set autowrite         " save file before switching a buffer
set autoindent        " indent
set showmatch         " highlight matching brackets
set autoread          " when file was changed
set lazyredraw        " redraw only when we need to"
set hlsearch          " highlight same words while searching with Shift + *

" line numbers
set number            " show
set numberwidth=5     " line numbers width
set number relativenumber " hybrid relative number + absolute

" make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1
set formatoptions+=w " for wraping long lines without broken words

" spaces
set tabstop=2     " tab width
set shiftwidth=2  " indent size
set softtabstop=2 " simulated tab width
set expandtab     " spaces on tab press
set smartindent   " indent automatically
set shiftround    " uses shiftwidth when >, <

"" map russian keyboard
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0

" show whitespaces
set list listchars=tab:»·,trail:·

" removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1

" disable sound
set visualbell t_vb=

" automatically refresh changed files
set autoread

" fold method definitions
set foldenable        " enable folding
set foldlevelstart=20 " open most folds by default
set foldmethod=indent " fold based on indent level
nnoremap fo za        " folding shortcut

" highlight trailing whitespaces
hi ExtraWhitespace ctermbg=172 guifg=#d78700
match ExtraWhitespace /\s\+$/

" make line number brighter
hi LineNr ctermfg=240 guifg=#585858

" close buffer by Alt + w
nnoremap ∑ :bd<CR>
" close buffer with force by Alt + q
nnoremap œ :bd!<CR>


" deoplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


nnoremap <C-p> :FZF<CR>


"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <space> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"NERDCommenter
set statusline+=%*


"" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Neomake
autocmd! BufWritePost,BufEnter * Neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" jsx
let g:jsx_ext_required = 0


let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Visuals: airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1 " https://github.com/bling/vim-airline/wiki/FAQ
let g:airline#extensions#whitespace#enabled = 0 " too obtrusive
"let g:airline_theme = "tender"
"let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#tabline#buffer_nr_show = 1
""let g:airline#extensions#tabline#buffer_nr_format = "%s:"
let g:airline#extensions#hunks#enabled = 0 " no room :(
let g:airline_section_y = '' " no room :'(
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1 " just nevever found it that useful :/

"set laststatus=2
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'


" easymotion
map <Leader> <Plug>(easymotion-prefix)





