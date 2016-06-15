
# MacPorts Installer addition on 2012-07-22_at_10:19:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH

# shell variables
#PS1="\n$PS1 "
#PS1="\h \W [\T]\n$PS1 "
#PS2=": "

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
export PATH=$PATH:/usr/local/bin/express

#---------------------------------------------
# aliases
#---------------------------------------------

alias ll='ls -l'
alias la='ls -la'
alias vi='vim'

[ -s "/Users/jerry_macair/.dnx/dnvm/dnvm.sh" ] && . "/Users/jerry_macair/.dnx/dnvm/dnvm.sh" # Load dnvm
