" An example for a gvimrc file.
" The commands in this are executed when the GUI is started, after the vimrc
" has been executed.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Apr 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" disable audiable bell
set vb t_vb=

colorscheme jellybeans

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
set guifont=consolas

"set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set guioptions-=m       "remove menu bar"
set guioptions-=T       "remove toolbar"
set guioptions-=r       "remove right hand scrollbar"
set guioptions-=L       "remove left hand scrollbar"
