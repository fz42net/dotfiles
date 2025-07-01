# Exports
export DOTFILES=$HOME/src/github.com/fz42net/dotfiles
export ZSH=$DOTFILES/zsh
export PROJECTS=$HOME/src/github.com/fz42net/

source $ZSH/options.zsh
source $ZSH/variables.zsh
source $ZSH/completion.zsh
source $ZSH/aliases.zsh
source $ZSH/bindings.zsh
source $ZSH/syntax-highlighting.zsh
source $ZSH/suggestions.zsh
source $ZSH/prompt.zsh

# Functions
fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)

source $ZSH/plugins/antidote/antidote.zsh
if [ -f "$ZSH/zsh_plugins.zsh" ] && [ -s "$ZSH/zsh_plugins.zsh" ]; then
  source $ZSH/zsh_plugins.zsh
else
  echo "Rebundling antidote"
  antidote bundle < $ZSH/zsh_plugins.txt > $ZSH/zsh_plugins.zsh
  source $ZSH/zsh_plugins.zsh
fi

if [[ $(uname) == "Linux" ]]; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_ed25519
fi

# Required to start tmuz on startup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Windsurf
export PATH="/Users/fz42net/.codeium/windsurf/bin:$PATH"

# Added by Windsurf
export PATH="/Users/fz42net/.codeium/windsurf/bin:$PATH"

# bun completions
[ -s "/Users/fz42net/.bun/_bun" ] && source "/Users/fz42net/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# BEGIN_AWS_SSO_CLI

# AWS SSO requires `bashcompinit` which needs to be enabled once and
# only once in your shell.  Hence we do not include the two lines:
#
# autoload -Uz +X compinit && compinit
# autoload -Uz +X bashcompinit && bashcompinit
#
# If you do not already have these lines, you must COPY the lines
# above, place it OUTSIDE of the BEGIN/END_AWS_SSO_CLI markers
# and of course uncomment it

__aws_sso_profile_complete() {
     local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    _multi_parts : "($(/opt/homebrew/bin/aws-sso ${=_args} list --csv Profile))"
}

aws-sso-profile() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -n "$AWS_PROFILE" ]; then
        echo "Unable to assume a role while AWS_PROFILE is set"
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Usage: aws-sso-profile <profile>"
        return 1
    fi

    eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -p "$1")
    if [ "$AWS_SSO_PROFILE" != "$1" ]; then
        return 1
    fi
}

aws-sso-clear() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -z "$AWS_SSO_PROFILE" ]; then
        echo "AWS_SSO_PROFILE is not set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso ${=_args} eval -c)
}

compdef __aws_sso_profile_complete aws-sso-profile
complete -C /opt/homebrew/bin/aws-sso aws-sso

# END_AWS_SSO_CLI

export PATH=$PATH:/Users/fz42net/.spicetify
alias claude="/Users/joe/.claude/local/claude"
