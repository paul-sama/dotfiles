# sudo pacman -S bash-completion
#if [ "$PS1" ]; then
#  if [ -r /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

#PS1='[\e[0;33m\]\t \[\e[0;31m\]\u \[\e[1;34m\]\W \[\e[0;0m]\$'
PS1='[\e[0;33m\]\t \[\e[1;34m\]\W \[\e[0;0m]\$'

export EDITOR=/usr/bin/vim

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/aliases ]; then
    . ~/aliases
fi

ex () {
    if [[ -z "$1" ]] ; then
           print -P "usage:ex  < filename >"
           print -P "       Extract the file specified based on the extension"
    elif [[ -f $1 ]] ; then
       case $1 in
         *.tbz2 | *.tar.bz2)  tar xjfv   $1    ;;
         *.tgz  | *.tar.gz)   tar xzfv   $1    ;;
         *.tar  | *.cbt)      tar xf     $1    ;;
         *.zip  | *.cbz)      unzip      $1    ;;
         *.bz2)               bunzip2 v  $1    ;;
         *.xz)                unxz       $1    ;;
         *.rar)               rar x      $1    ;;
         *.gz)                gunzip     $1    ;;
         *.7z)                7z x       $1    ;;
         *.Z)                 uncompress $1    ;;
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
    cat /tmp/rxdict.tmp
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
