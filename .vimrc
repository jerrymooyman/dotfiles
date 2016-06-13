" Table of Contents
"
"
"
"
"


" Setup Vundle ======================="

set nocompatible
filetype off

" Initialise Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Inception Vundle! Using Vundle to manage the Vundle plugin
Plugin 'gmarik/Vundle.vim'






"""" Filetypes ========================

" json
Plugin 'elzr/vim-json'

" javascript
Plugin 'jelera/vim-javascript-syntax'
    "let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter'


Plugin 'mxw/vim-jsx'                    "React syntax highlting
    let g:jsx_ext_required = 0  "enable jsx on .js files


Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
    "let b:javascript_fold=1
    "let g:javascript_enable_domhtmlcss = 1


" web syntax
Plugin 'othree/html5.vim'


"""" End Filetypes ====================







"""" Utilities ========================

Plugin 'tpope/vim-fugitive'             "Git wrapper
Plugin 'L9'                             "dependency for FuzzyFinder
Plugin 'FuzzyFinder'

Plugin 'Valloric/YouCompleteMe'         "auto completion
    let g:ycm_key_list_select_completion=[]     "disable to make ultisnip work with <tab>
    let g:ycm_key_list_previous_completion=[]   "disable to make ultisnip work with <tab>
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_confirm_extra_conf=0
    set completeopt-=preview
    nnoremap <F12> :YcmCompleter GoTo<CR>
    nnoremap <leader>jt :YcmCompleter GetType<CR>


Plugin 'scrooloose/syntastic'           "syntax checker
    let g:syntastic_check_on_open=1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_html_tidy_exec = 'tidy5'
    let g:syntastic_html_tidy_ignore_errors = [
        \'<body> proprietary attribute "ng-app"', 
        \'<body> proprietary attribute "animation""', 
        \'<ion-nav-bar> is not recognized!', 
        \'<ion-nav-view> is not recognized!', 
        \'<ion-nav-back-button> is not recognized!']
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

Plugin 'OmniSharp/omnisharp-vim'        "generic language
    set omnifunc=syntaxcomplete#Complete
    set completeopt=longest,menuone
    inoremap <Nul> <C-x><C-o>


"Plugin 'ternjs/tern_for_vim'

Plugin 'sirver/ultisnips'               "snippets
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.


Plugin 'honza/vim-snippets'             "this one goes with ultisnips
Plugin 'mattn/emmet-vim'                "code completer

Plugin 'Raimondi/delimitMate'           "Automatic closing of quotes, brackets, etc.
Plugin 'scrooloose/nerdcommenter'       "code commenter
    nmap <C-c><C-c> <leader>ci


Plugin 'maksimr/vim-jsbeautify'         "code formatter
    map <c-f> :call JsBeautify()<cr>
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

    autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


Plugin 'tpope/vim-dispatch'             "shell out tasks

"""" End Utilities ====================







"""" UI Plugins =======================
Plugin 'scrooloose/nerdtree'            "Sidebar file system explorer
    nnoremap FF :NERDTreeToggle<CR><leader><S-b>

Plugin 'majutsushi/tagbar'              "Sidebar file tags
    nnoremap <F8> :TagbarToggle<CR> 

Plugin 'vim-airline/vim-airline'
    set laststatus=2
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#left_sep=' '
    let g:airline#extensions#tabline#left_alt_sep='|'



"""" End UI Plugins ===================







"""" Code Navigation ==================

Plugin 'rking/ag.vim'                   "super fast search - silver Searcher
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects
        " .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0

        " don't open the quick fix window
        let g:Grep_OpenQuickfixWindow = 0 
    endif

    " bind K to grep word under cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

Plugin 'kien/ctrlp.vim'                 "search utility
    let g:ctrlp_map='<C-p>'
    let g:ctrlp_cmd='CtrlP'
    let g:ctrlp_working_path_mode='ra'

Plugin 'Shougo/unite.vim'

"""" End Code Navigation ==============






"Plugin 'burnettk/vim-angular'
"Plugin 'othree/yajs.vim'
"Plugin 'sheerun/vim-polyglot'

"Plugin 'nathanaelkane/vim-indent-guides'


"Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

" Turn on plugins, indentation, etc.
filetype plugin indent on

""" End setup Vundle ==================







""" Handle FileTypes ==================

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.handlebar set filetype=html






""" UI Tweaks =========================

set t_Co=256
syntax enable
set number                              " displays line numbers
set cursorline

set hidden                              " hides buffers instead of closing them
set title

set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set shiftround
set expandtab 
set smarttab
set autoindent

set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set autochdir

set nobackup
set noswapfile

colorscheme jellybeans

set runtimepath^=~/.vim/bundle/node
set runtimepath^=~/.vim/bundle/ctrlp.vim

nmap <leader>R :source $MYVIMRC<CR>





""" Other Tweaks =====================


" buffer nav
nnoremap <C-n> :bnext<CR>
nnoremap <C-m> :bprevious<CR>
"nnoremap <C-w> :bdelete<CR>


