# Bash config file

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

# Import ~/.profile
source ~/.profile

# History
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups:erasedups # No duplicate entries

# Set Vi mode
set -o vi

# Change to parent path with completion
function _dcBackwardsPathCompletion() {
    # Note: must be used with complete -o nospace
    # $1=cmd $2=cur $3=pre
    local cwd="${2:-$PWD}"
    local upd="${cwd%/*}"
    if [[ $cwd == '/' ]]; then
        return
    elif [[ $upd == '' ]]; then
        COMPREPLY=('/')
    else
        COMPREPLY=("$upd")
    fi
}

function dc() { cd ${1:-..}; }
complete -o nospace -F _dcBackwardsPathCompletion dc

# Use fzf keybindings
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

# Prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set up starship prompt
eval "$(starship init bash)"

# Open at start
neofetch

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/evf/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/evf/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
