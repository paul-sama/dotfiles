# sudo pacman -S bash-completion
#if [ "$PS1" ]; then
#  if [ -r /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

#PS1='[\e[0;33m\]\t \[\e[0;31m\]\u \[\e[1;34m\]\W \[\e[0;0m]\$'
PS1='[\e[0;33m\]\t \[\e[1;34m\]\W \[\e[0;0m]\$'

export EDITOR=/usr/bin/vim

# User specific aliases and functions
alias     l='ls -CF'
alias    ll='ls -lh'
alias    la='ls -A'
alias   lla='ls -Alh'

alias    du='du -h --max-depth=1'

alias    pp='ping douban.com'
alias   ppp='ping baidu.com'
alias  pppp='ping 192.168.0.1'

alias    vi='vim'
alias     v='vim'
alias     p='python2'

alias  sshh='ssh -v -CNgD 7070 Aoy'

# enable color support
alias    ls='ls --color=auto'
alias   dir='dir --color=auto'
alias  grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

export PATH=$PATH:/home/jary_p/local/ChromePlus

export JAVA_HOME=/opt/jdk1.6.0_20
export TOMCAT_HOME=/opt/tomcat
export JAVA_JRE=$JAVA_HOME/jre
export CLASS_PATH=.:$JAVA_HOME/lib:$JAVA_JRE/lib
export PATH=$JAVA_HOME/bin:$JAVA_JRE/bin:$PATH


ex () {
   if [[ -z "$1" ]] ; then
       echo  "usage: ex  < filename >"
       echo  "       Extract the file specified based on the extension"
   elif [ -f $1 ] ; then
       case $1 in
         *.tar.bz2)   tar xjfv $1    ;;
         *.tar.gz)    tar xzfv $1    ;;
         *.bz2)       bunzip2v $1    ;;
         *.rar)       rar x $1       ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xf $1      ;;
         *.tbz2)      tar xjf $1     ;;
         *.tgz)       tar xzf $1     ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *)           echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
     echo "'$1' is not a valid file"
   fi
}


fy () {
    w3m -no-cookie -dump 'http://dict.baidu.com/s?wd='$1'&f=3'  \
    | sed '/以下结果来自互联网网络释义/,$d'| sed '1,15d' | tac \
    | sed '1,2d' | tac |sed -r '/^[0-9]+\./N;s/\n//'>/tmp/rxdict.tmp
    less /tmp/rxdict.tmp
}

256tab () {
    for k in `seq 0 1`;do
        for j in `seq $((16+k*18)) 36 $((196+k*18))`;do
            for i in `seq $j $((j+17))`; do
                printf "\e[01;$1;38;5;%sm%4s" $i $i;
            done;echo;
        done;
    done
}

calc() { awk "BEGIN{ print $* }" ; }
