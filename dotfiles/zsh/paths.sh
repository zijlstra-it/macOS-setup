# macOS-setup/dotfiles/zsh/paths.sh

if [[ -d /usr/local/opt/gnu-getopt/bin ]]; then
    export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
fi
if [[ -d /usr/local/opt/grep/libexec/gnubin ]]; then
    export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
fi

if [[ -d /Users/${USERNAME}/.cargo/bin ]]; then
    export PATH="/Users/${USERNAME}/.cargo/bin:$PATH"
fi

if [[ -d /Users/${USERNAME}/.local/bin ]]; then
    export PATH="/Users/${USERNAME}/.local/bin:$PATH"
fi

# Extend PATH with personal bin dir.
export PATH=$PATH:~/bin
