# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\e[0;33m\]\t \[\e[0;31m\]\u \[\e[1;34m\]\W \[\e[0;0m]\$'


# User specific aliases and functions
alias  ls='ls --color=auto'
alias  ll='ls -l'
alias  la='ls -A'
alias   l='ls -CF'

alias  vi='vim'
alias   v='vim'

alias vps='ssh root@64.120.134.216 -p 37266'

export PATH=$PATH:/home/jary_p/local/bin
