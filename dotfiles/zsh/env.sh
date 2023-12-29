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
