alias reload!='. ~/.zshrc'
alias cls='clear'

alias s='sesh connect $(sesh list | fzf)'
alias S='sesh connect "$(fd -td --max-depth 1 . ~/Documents ~/src/github.com/fz42net | fzf)"'

alias delete_pycache='find . -name '__pycache__' -type d -exec rm -r {} +'

alias vi='nvim'
alias vim='nvim'

alias d='docker $*'
alias d-c='docker-compose $*'

alias chmox='chmod +x'

# Pipe my public key to my clipboard. Stolen from https://github.com/holman
alias pubkey='[ "$(uname)" = "Darwin" ] && { cat ~/.ssh/id_ed25519.pub | pbcopy && echo "=> Public key copied to pasteboard."; } || { /bin/cat ~/.ssh/id_ed25519.pub && echo "=> Copy the key from above manually."; }'
#alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias fz_http="python -m http.server"
alias fz_pinglisten='sudo tcpdump ip proto \\icmp'

alias history="history 1"

alias gs="git status"
alias gl="git log -n 5 --graph --decorate --oneline"

if [[ $(uname) == "Darwin" ]]; then
  alias killdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
  alias killaudio='sudo killall -9 coreaudiod'
  alias cat='bat'
else
  alias cat='batcat'
fi
