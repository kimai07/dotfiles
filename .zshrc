# users generic .zshrc file for zsh(1)

export TERM=xterm-256color
export TZ=Japan
export LOCAL_HOME=$HOME/local
export MYSQL5_BIN=/opt/local/lib/mysql5/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$LOCAL_HOME/bin:$MYSQL5_BIN:$PATH

### Amazon EC2 API Tools の場所を設定 ###
export EC2_HOME=$LOCAL_HOME/EC2
export PATH=$EC2_HOME/bin:$PATH

export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

### 先にダウンロードしたキーファイル2つの場所の設定 ###
export EC2_CERT=$EC2_HOME/cert-PYEXUGUX7D3QIOB7L27FABYJTVKSGVWO.pem
export EC2_PRIVATE_KEY=$EC2_HOME/pk-PYEXUGUX7D3QIOB7L27FABYJTVKSGVWO.pem

export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

#export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad


## Environment variable configuration
#
# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8


## 補完機能
autoload -U compinit # コマンド補完をONに
compinit

# ディレクトリ
#setopt auto_push         # cd 時に自動で push
setopt pushd_ignore_dups # 同じディレクトリを pushd しない

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# ビープを鳴らさない
setopt nobeep
setopt nolistbeep

# 補完候補一覧でファイルの種別をマーク表示
setopt list_types

# compacked complete list display
setopt list_packed

# =command を command のパス名に展開する
setopt equals

# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

# ヒストリを呼び出してから実行する間に一旦編集
#setopt hist_verify

# ファイル名の展開で辞書順ではなく数値順にソート
#setopt numeric_glob_sort

# 出力時8ビットを通す
#setopt print_exit_value

# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

# 補完候補の色付け
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ディレクトリ名だけで cd
setopt auto_cd

DIRSTACKSIZE=16
builtin dirs /Users/kimai/local /Users/kimai/local/src /Users/kimai/local/work

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
#setopt auto_param_slash

# スペルチェック
setopt correct

# keep background processes at full speed
#setopt NOBGNICE
# restart running processes on exit
#setopt HUP

# history
#setopt APPEND_HISTORY
# for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

# never ever beep ever
#setopt NO_BEEP

# automatically decide when to page a list of completions
#LISTMAX=0

# disable mail checking
#MAILCHECK=0

#autoload -U colors
#colors

# コマンド履歴機能
HISTFILE=~/.zsh_history #履歴ファイル
HISTSIZE=10000          #履歴サイズ
SAVEHIST=10000          #履歴サイズ

setopt hist_ignore_dups #履歴リストで重複コマンドを無視する
setopt share_history    #履歴を複数端末で共有する
setopt extended_history #zshの開始、終了時刻をヒストリファイルに書き込む

# Color
BLACK=$'%{\e[1;30m%}'
RED=$'%{\e[1;31m%}'
GREEN=$'%{\e[1;32m%}'
YELLOW=$'%{\e[1;33m%}'
BLUE=$'%{\e[1;34m%}'
MAGENTA=$'%{\e[1;35m%}'
CYAN=$'%{\e[1;36m%}'
WHITE=$'%{\e[1;37m%}'
DEFAULT=$'%{\e[1;0m%}'

# Prompt
#setopt prompt_subst
#PROMPT='[%n@%m] %#'
PROMPT='[%n]%# ' 
RPROMPT=' [%~ %T]'

# Terminal Title
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}:${PWD}\007"
        #echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# キーバインド設定
bindkey -e

# 履歴検索機能のショートカット設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "" history-beginning-search-backward-end
bindkey "" history-beginning-search-forward-end

## グローバルエイリアス
#
alias -g E='|nkf -e'
alias -g G='|grep'
alias -g M='|more'
alias -g H='|head'
alias -g S='|sort'
alias -g T='|tail'
alias -g L='|less'
alias -g W='|wc'


## エイリアス
#
# cd
alias ..='cd ..;ls'
alias cdht='cd /opt/local/apache2/htdocs'
alias cdaplog='cd /opt/local/apache2/logs'

#
alias grep='grep --color'

# ls
alias ls='ls -aFG'
alias ll='ls -alFG'

# make
alias gm='make'
alias gmc='make clean'

# apache
alias apst='sudo /opt/local/apache2/bin/apachectl start'
alias apsp='sudo /opt/local/apache2/bin/apachectl stop'
alias aprst='sudo /opt/local/apache2/bin/apachectl restart'

# mysql
alias mysql_start='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysql_stop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias mysql_svr_start='sudo /opt/local/lib/mysql5/bin/mysqld_safe --user=root &'
alias mysql_svr_stop='sudo /opt/local/lib/mysql5/bin/mysqladmin --user=root -p shutdown'

# mongo
alias mongod_start='mongod --dbpath=/Users/kimai/local/var/mongodb/data/db'

function cctags {
  ctags -R $PWD/*
  find . -type d \! -path '*/.svn' -exec cp ./tags {}/ \;
}
