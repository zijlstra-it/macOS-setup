# ~/git/dotfiles/zsh/base.sh

# history settings
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILESIZE=10000
export HISTSIZE=10000

# fix remote locale as by default LC_* is send by SSH
export LC_CTYPE=en_US.UTF-8

# fix secondary prompt
set -o transientrprompt; PS2= RPS2=

# fix for https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
export ZSH_DISABLE_COMPFIX=true

# export KUBECONFIG to the local kubeconfig; powerline10k will show the environment in the prompt
export KUBECONFIG=./kubeconfig

# no Google Analytics for Brew
export HOMEBREW_NO_GOOGLE_ANALYTICS=1

# Exa/Eza colors
export EXA_COLORS="uu=33:gu=33:ur=33:uw=31:ux=32:ue=32:sn=32:da=36:xx=37"

# Brew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  # eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_PREFIX="/opt/homebrew";
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
  export HOMEBREW_REPOSITORY="/opt/homebrew";
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

# Pyenv
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi
