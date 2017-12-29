# users generic .zshrc file for zsh(1)

export TERM=xterm-256color
export TZ=Japan
export LOCAL_HOME=$HOME/local
export MYSQL5_BIN=/opt/local/lib/mysql5/bin
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH

### Amazon EC2 API Tools の場所を設定 ###
export EC2_HOME=$LOCAL_HOME/EC2
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
### 先にダウンロードしたキーファイル2つの場所の設定 ###
export EC2_CERT=$EC2_HOME/cert-PYEXUGUX7D3QIOB7L27FABYJTVKSGVWO.pem
export EC2_PRIVATE_KEY=$EC2_HOME/pk-PYEXUGUX7D3QIOB7L27FABYJTVKSGVWO.pem


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


# 主に zsh 特有のオプションの設定
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

if [ -f .zprofile ]; then
  source .zprofile
fi

