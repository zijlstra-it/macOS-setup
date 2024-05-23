# macOS-setup/dotfiles/zsh/auto_completion.sh

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
