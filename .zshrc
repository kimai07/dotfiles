# users generic .zshrc file for zsh(1)

export TERM=xterm-256color
export TZ=Japan
export LOCAL_HOME=$HOME/local
export GIT_HOME=$HOME/local/git/kenji-imi

#export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad


## Environment variable configuration
#
# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8


## 補完機能
export BREW_PREFIX=`/usr/local/bin/brew --prefix`
fpath=(${BREW_PREFIX}/share/zsh/site-functions $fpath)
## Path

export PYTHONIOENCODING=utf-8

#export EVENT_NOKQUEUE=1


## Golang設定
export GO111MODULE=on


# 主に zsh 特有のオプションの設定
cd $HOME
if [ -f .zsh_option ]; then
  source .zsh_option
fi

if [ -f .zsh_path ]; then
  source .zsh_path
fi

# 主にエイリアスの設定
if [ -f .zsh_alias ]; then
  source .zsh_alias
fi

if [ -f .zsh_secret ]; then
  source .zsh_secret
fi

if [ -f .zprofile ]; then
  source .zprofile
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kimai/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kimai/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kimai/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kimai/google-cloud-sdk/completion.zsh.inc'; fi

cd -
