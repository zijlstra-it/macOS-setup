# macOS-setup/dotfiles/zsh/aliases.sh

# helper function 
exists()
{
  command -v "$1" >/dev/null 2>&1
}

# start of aliases
alias rm='rm -i'
alias zsh-reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias cl='clear'
alias q='exit'
alias bwlogin='bw login --apikey'

if [ -f ~/bin/ssh-or-copy-id.sh ]; then
  alias ssh='~/bin/ssh-or-copy-id.sh'
fi

if exists eza; then
  alias ls='eza --icons=auto' 
  alias ll='eza --icons=auto -g -l --git -b --octal-permissions'
  alias ltr='eza --icons=auto -g -l --git -b --octal-permissions --tree --level=3'
  alias la='eza --icons=auto -g -l -a -b --git --octal-permissions'
  alias lt='eza --icons=auto -g -l -b --git --sort=modified --octal-permissions'
  alias lat='eza --icons=auto -g -l -b -a --git --sort=modified --octal-permissions'
  alias latr='eza --icons=auto -g -l -a -r --git -b --sort=modified --octal-permissions'
else
  alias ls='ls -G'
  alias ll='ls -l'
  alias la='ls -la'
  alias lt='ls -ltr'
fi

if exists nvim; then
  alias vi='nvim'
  alias vimdiff='nvim -d'
fi

# point to MacOS ssh for Passkey support
alias ssh='/usr/bin/ssh'

if exists lazygit; then
  alias lg='lazygit'
fi
