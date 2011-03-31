autoload -U promptinit
promptinit
prompt adam2    #prompt -p 查看提示符样式

autoload -Uz compinit   #开启自动补全
compinit

bindkey -e    #Emacs风格键绑定 Ctrl+a Ctrl+e
bindkey "\e[3~" delete-char     #设置 [DEL]键 为向后删除

export HISTSIZE=1000  # number of lines kept in history
export SAVEHIST=1000  # number of lines saved in the history after logout
export HISTFILE=~/.zsh_history  # location of history
export SUDO_PROMPT=$'[\e[31;5msudo\e[m] password for \e[33;1m%p\e[m: '

export EDITOR=vim
export VISUAL=vim

alias     df='df -Th'
alias    cal='cal -3m'
alias   grep='grep -I --color=auto'
alias  egrep='egrep -I --color=auto'
#alias pacman='pacman-color'

alias    ls=$'ls -h --color=auto -X --time-style="+\e[33m[\e[32m%Y-%m-%d \e[35m%k:%M\e[33m]\e[m"'
alias     l='ls -CF'
alias    ll='ls -lh'
alias    la='ls -A'
alias   lla='ls -Alh'
alias    du='du -s *(/) -h'

alias   t.l='tar tf'

alias    p6='ping6 ipv6.google.com'
alias    pp='ping douban.com'
alias   ppp='ping baidu.com'
alias  pppp='ping 192.168.0.1'

alias pushwiki='rsync -zrq  --delete /home/jary_p/wiki/html/ imhost:wiki/'

alias     v='vim'
alias    vi='vim'
alias     e='emacsclient -t -a ""'
alias    em='emacsclient -t -a ""'
alias     p='python2'

alias  sshh='ssh -v -CNgD 7070 orange'

##路径别名  进入相应的路径时只要 cd ~xxx
#hash -d WWW="/home/lighttpd/html"
#hash -d ARCH="/mnt/arch"
#hash -d PKG="/var/cache/pacman/pkg"
#hash -d E="/etc/env.d"
#hash -d C="/etc/conf.d"
#hash -d I="/etc/rc.d"
#hash -d X="/etc/X11"


#文件关联
alias -s pdf=foxitreader        #pdf文件用foxitreader打开,下同
alias -s txt=vim
for i in jpg png;          alias -s $i=feh
for i in avi rmvb wmv mkv; alias -s $i=mplayer

# 设置参数
#setopt complete_aliases #do not expand aliases _before_ completion has finished
setopt auto_cd # if not a command, try to cd to it.
setopt auto_pushd # automatically pushd directories on dirstack  #启用cd 命令的历史纪录,cd -[TAB]进入历史路径
setopt auto_continue #automatically send SIGCON to disowned jobs
setopt extended_glob # so that patterns like ^() *~() ()# can be used
setopt pushd_ignore_dups # do not push dups on stack
setopt pushd_silent # be quiet about pushds and popds
setopt brace_ccl # expand alphabetic brace expressions
#setopt chase_links # ~/ln -> /; cd ln; pwd -> /
setopt complete_in_word # stays where it is and completion is done from both ends
setopt correct # spell check for commands only
#setopt equals extended_glob # use extra globbing operators
setopt no_hist_beep # don not beep on history expansion errors
setopt hash_list_all # search all paths before command completion
setopt hist_ignore_all_dups # when runing a command several times, only store one
setopt hist_reduce_blanks # reduce whitespace in history
setopt hist_ignore_space # do not remember commands starting with space
setopt share_history # share history among sessions
setopt hist_verify # reload full command when runing from history
setopt hist_expire_dups_first #remove dups when max size reached
setopt interactive_comments # comments in history
setopt list_types # show ls -F style marks in file completion
setopt long_list_jobs # show pid in bg job list
setopt numeric_glob_sort # when globbing numbered files, use real counting
setopt inc_append_history # append to history once executed
setopt prompt_subst # prompt more dynamic, allow function in prompt
setopt nonomatch 

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#彩色补全菜单 
eval $(dircolors -b) 
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#kill 命令补全  不用再输入数字了><
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=1;31"
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'

# 补全之后 类型提示分组  这个好强大~ 
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[33m == \e[1;7;36m %d \e[m\e[33m ==\e[m'
zstyle ':completion:*:messages' format $'\e[33m == \e[1;7;36m %d \e[m\e[0;33m ==\e[m'
zstyle ':completion:*:warnings' format $'\e[33m == \e[1;7;31m No Matches Found \e[m\e[0;33m ==\e[m'
zstyle ':completion:*:corrections' format $'\e[33m == \e[1;7;37m %d (errors: %e) \e[m\e[0;33m ==\e[m'

##在命令前插入 sudo 
#{{{
##定义功能 
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

#MOST like colored Man Pages
export PAGER=less
export LESS_TERMCAP_md=$'\E[1;31m' #bold1
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_me=$'\E[m'
export LESS_TERMCAP_so=$'\E[01;7;34m' #search highlight
export LESS_TERMCAP_se=$'\E[m'
export LESS_TERMCAP_us=$'\E[1;2;32m' #bold2
export LESS_TERMCAP_ue=$'\E[m'
export LESS="-M -i -R --shift 5"
export LESSCHARSET=utf-8
export READNULLCMD=less]

##zsh中让敲出来的命令带颜色  http://roylez.heroku.com/2010/10/24/zsh-command-color.html
#{{{
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                *'reserved word'*)   style="fg=magenta,bold";;
                *'alias for'*)       style="fg=cyan,bold";;
                *'shell builtin'*)   style="fg=yellow,bold";;
                *'shell function'*)  style='fg=green,bold';;
                *"$arg is"*)         
                    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                *)                   style='none,bold';;
            esac
            region_highlight+=("$start_pos $end_pos $style")
        fi
        [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        start_pos=$end_pos
    done
}

check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char
#}}}

# 一些普通的自定义函数
256tab() {
    for k in `seq 0 1`;do
        for j in `seq $((16+k*18)) 36 $((196+k*18))`;do
            for i in `seq $j $((j+17))`; do
                printf "\e[01;$1;38;5;%sm%4s" $i $i;
            done;echo;
        done;
    done
}

# 补全类型控制
# ex [tab] 的候选菜单中只出现扩展名为设定的文件
compctl -g '*.tar.bz2 *.tar.gz *.bz2 *.gz *.xz *.rar *.tar *.tbz2 *.tgz *.zip *.7z *.Z' + -g '*(-/)' ex

ex () {
    if [[ -z "$1" ]] ; then
           print -P "usage: \e[1;36mex\e[1;0m < filename >"
           print -P "       Extract the file specified based on the extension"
    elif [[ -f $1 ]] ; then
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
    cat /tmp/rxdict.tmp
}
