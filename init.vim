" things to look into



" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

"=========== Search ============================================
" fuzzy search
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/opt/fzf'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" file search
Plug 'rking/ag.vim'
" https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
" https://github.com/junegunn/fzf/blob/master/README-VIM.md


"=========== Files / Directories ===============================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdcommenter'


"=========== Source Control ====================================
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'


"=========== Programming languages =============================

Plug 'neovimhaskell/haskell-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
" ref: https://fortes.com/2017/language-server-neovim/

"Plug 'bitc/hdevtools'

Plug 'zchee/deoplete-jedi'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


"=========== Linters / Checkers ================================
" https://github.com/w0rp/ale#faq-disable-linters
Plug 'w0rp/ale'

"Plug 'neomake/neomake'
"Plug 'vim-syntastic/syntastic'



"=========== Autocompleter =====================================
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-completion-manager'   // repo has been archived
"Plug 'ervandew/supertab'   //has clash with other plugins




"=========== Themes ============================================
Plug 'herrbischoff/cobalt2.vim'
Plug 'trevordmiller/nova-vim'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/Solarized'

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'


call plug#end()

let mapleader = ";"

" enable syntax highlighting
syntax on

" theme
set t_co=256
"set background=light
set background=dark
"colorscheme nova
"colorscheme gruvbox
"colorscheme zenburn
"
"colorscheme cobalt2
"colorscheme solarized

"let g:airline_theme = "zenburn"
"let g:airline_theme = "cobalt2"
"let g:airline_theme = "solarized"



" close buffer
nnoremap <leader>d :bd<CR>
" close all buffers
nnoremap <leader>D :%bd<CR>
" list buffers
nnoremap <Leader>b :Buffers<CR>

" vert split
nnoremap <leader>v :vs<CR>


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
set cursorline        " hightlight current line

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


"fuzzy search
"nnoremap <C-p> :FZF<CR>
nnoremap <C-p> :GFiles<CR>


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
let g:NERDTreeWinSize=60
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
"autocmd! BufWritePost,BufEnter * Neomake
"" When writing a buffer (no delay).
"call neomake#configure#automake('w')
"" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
"" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
"" Full config: when writing or reading a buffer, and on changes in insert and
"" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)

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

" checkers / linters
"let g:neomake_javascript_enabled_makers = ['eslint']
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Show 5 lines of errors (default: 10)
"let g:ale_list_window_size = 5
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1


"Haskell
"Language Client
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'haskell': ['hie'],
    \ }
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

nnoremap <silent> lm :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> lf :call LanguageClient#textDocument_documentSymbol()<CR>

"let g:LanguageClient_settingsPath = "~/.config/nvim/settings.json"


" format JSON
" %!python -m json.tool
command! FormatJSON %!jq '.'

