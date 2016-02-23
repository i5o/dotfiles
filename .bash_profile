
export _is_osx=0
export _is_nix=0

case "$OSTYPE" in
  darwin*)  _is_osx=1 ;; 
  linux*)   _is_nix=1 ;;
esac


if [ -x "`which keychain`" ]; then
    if [ -f ~/.ssh/id_rsa ]; then
        keychain --quiet ~/.ssh/id_rsa
        if [ -f ~/.keychain/sente.cc-sh ]; then
              . ~/.keychain/sente.cc-sh > /dev/null
        fi
    fi
fi


if [ -f "${HOME}/.bashrc" ]; then
      . "${HOME}/.bashrc"
fi

export PATH="/usr/local/sbin:$PATH"

if [[ $_is_osx -eq 1 ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
