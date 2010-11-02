PS1='[\e[0;33m\]\t \[\e[0;31m\]\u \[\e[1;34m\]\W \[\e[0;0m]\$'

# User specific aliases and functions
alias    l='ls -CF'
alias   ls='ls --color=auto'
alias   ll='ls -lh'
alias   la='ls -A'
alias  lla='ls -Alh'

alias   du='du -h --max-depth=1'

alias   pp='ping douban.com'
alias  ppp='ping baidu.com'

alias   vi='vim'
alias    v='vim'


ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjfv $1        ;;
      *.tar.gz)    tar xzfv $1     ;;
      *.bz2)       bunzip2v $1       ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1        ;;
      *.tbz2)      tar xjf $1      ;;
      *.tgz)       tar xzf $1       ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


fy () {
    w3m -no-cookie -dump 'http://dict.baidu.com/s?wd='$1'&f=3'  \
    | sed '/以下结果来自互联网网络释义/,$d'| sed '1,15d' | tac \
    | sed '1,2d' | tac |sed -r '/^[0-9]+\./N;s/\n//' > /tmp/rxdict.tmp
    less /tmp/rxdict.tmp
}
