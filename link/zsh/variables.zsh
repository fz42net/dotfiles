export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
export EDITOR='vim'
export VISUAL='vim'
export PAGER='most'
export GROFF_NO_SGR=1 # Needed for colorful man output on linux

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

if command -v go > /dev/null; then
  export GOBIN="$HOME/go/bin"
  export PATH="$GOBIN:$PATH"
fi

if command -v dotnet > /dev/null; then
  export PATH="$HOME/.dotnet/tools:$PATH"
fi

if [[ $(uname) == "Linux" ]]; then
  export PATH="/snap/bin:$PATH"
fi
