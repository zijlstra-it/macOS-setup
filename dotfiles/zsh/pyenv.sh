# pyenv settings
if which pyenv >/dev/null 2>&1 ;  then
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"

  # Let pipenv use the pyenv version activated
  export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
fi
