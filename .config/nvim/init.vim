


" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ====================================================================
" Plugins
" ====================================================================
call plug#begin('~/.config/nvim/plugged')

"----------- Search --------------------------------------------
" fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" file search
Plug 'rking/ag.vim'
" https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
" https://github.com/junegunn/fzf/blob/master/README-VIM.md


"----------- Navigation ----------------------------------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'


"----------- Editing -------------------------------------------
Plug 'scrooloose/nerdcommenter'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }


Plug 'SirVer/ultisnips'
"Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'



"----------- Source Control ------------------------------------
" Plug 'airblade/vim-gitgutter'
" Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tsony-tsonev/nerdtree-git-plugin'



"----------- Programming languages -----------------------------
" language server client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" more info on coc extensions
"https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions


"----------- javascript / Typescript ---------------------------
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plug 'carlitux/deoplete-ternjs'
" Plug 'zchee/deoplete-jedi'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'

" c/o :CocInstall coc-tsserver
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'ianks/vim-tsx'


"----------- Flutter -------------------------------------------
Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'
" also coc-flutter


"----------- Haskell -------------------------------------------
" Plug 'neovimhaskell/haskell-vim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': './install.sh'
"     \ }
" ref: https://fortes.com/2017/language-server-neovim/

"Plug 'bitc/hdevtools'


"----------- Linters / Checkers --------------------------------
" https://github.com/w0rp/ale#faq-disable-linters
" Plug 'w0rp/ale'
" c/o coc-eslint



"=========== Autocompleter =====================================
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote')}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-completion-manager'   // repo has been archived
"Plug 'ervandew/supertab'   //has clash with other plugins

"Plug 'ludovicchabant/vim-gutentags'



"=========== Productivity ======================================
Plug 'vimwiki/vimwiki'

"
"Plug 'plasticboy/vim-markdown'


"----------- Themes -------------------------------------------
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/Solarized'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'


call plug#end()
" ====================================================================

" add files to runtime
"set rtp+=~/.config/nvim
"set rtp+=~/.vim


" ====================================================================
" Theme
" ====================================================================
set encoding=UTF-8
set t_co=256

" for light theme
"set background=light

colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:airline_theme = "solarized"

" for dark theme
set background=dark

"colorscheme PaperColor
"let g:airline_theme = "papercolor"

colorscheme gruvbox
let g:airline_theme = "gruvbox"



" Airline
" -------------------------------------------------------------
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
"let g:airline#extensions#tabline#left_alt_sep='|

" ====================================================================






" ====================================================================
" Basic Settings
" ====================================================================

let mapleader = ";"

" enable syntax highlighting
syntax on

" required to detect filetype
filetype plugin indent on

set shell=/bin/zsh


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

"set statusline+=%*

" ====================================================================



" ====================================================================
" Miscellaneous
" ====================================================================

" no highlight
map <c-_> :noh<CR>

" ====================================================================




" ====================================================================
" Buffer management
" ====================================================================

" close buffer
nnoremap <leader>d :bd<CR>
" close all buffers
nnoremap <leader>D :%bd<CR>
" list buffers
nnoremap <leader><space> :Buffers<CR>
" close all other windows
nnoremap <leader>c :only<CR>
" vert split
nnoremap <leader>v :vs<CR>

" ====================================================================




" ====================================================================
" NERDTree
" ====================================================================

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
"map <F8> :NERDTreeToggle<CR>
map <c-n> :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>


let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize=60
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

let g:NERDTreeGitStatusWithFlags = 1


" NOTE: not working correctly
" sync open file with NERDTree
" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" ====================================================================


" ====================================================================
" NERDCommenter
" ====================================================================
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" Sample:
"   <leader>ci - toggle comment
" ====================================================================




" ====================================================================
" vim-jsx
" ====================================================================
autocmd BufNewFile,BufRead *.js set filetype=typescript.tsx
" ====================================================================




" ====================================================================
" Easymotion
" ====================================================================
map <Leader> <Plug>(easymotion-prefix)
" Sample:
"   <leader>s[search term] - trigger easymotion
" ====================================================================



" ====================================================================
" Fuzzy Search
" ====================================================================
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :GFiles?<CR>
" ====================================================================



" ====================================================================
" UltiSnips
" ====================================================================
" need this to get ultisnips to recognise filetypes
au FileType javascript :UltiSnipsAddFiletypes javascript typescript

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir = "~/.vim/my_snippets/"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.".vim/my_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ====================================================================




" ====================================================================
" Prettier
" ====================================================================
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" ====================================================================




" ====================================================================
" Coc - Language server client
" ====================================================================

" extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-markdown',
  \ 'coc-flutter'
  \ ]

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" NOTE: remap to avoid <C-i> chord clash
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"nmap <silent> <C-e> <Plug>(coc-range-select)
"xmap <silent> <C-e> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ====================================================================


" ====================================================================
" vimwiki
" ====================================================================

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" ====================================================================
