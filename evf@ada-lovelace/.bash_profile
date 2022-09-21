#!/bin/bash

##########
# COLORS #
##########

# ANSI color code variables
RED="\e[0;91m"
BLUE="\e[0;94m"
EXPAND_BG="\E[K"
BLUE_BG="\e[0;104m${EXPAND_BG}"
RED_BG="\e[0;101m${EXPAND_BG}"
GREEN_BG="\e[0;102m${EXPAND_BG}"
GREEN="\e[0;92m"
WHITE="\e[0;97m"
BOLD="\e[1m"
ULINE="\e[4m"
RESET="\e[0m"

########
# PATH #
########

# Append to PATH if not already there
function pathappend {
    for ARG in "$@"; do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="${PATH:+"$PATH:"}$ARG"
        fi
    done
}

# System binaries
pathappend /bin /usr/bin /usr/local/bin /usr/local/sbin

# Custom scripts
pathappend ~/.local/bin

# Custom binaries
pathappend ~/bin

# Julia
pathappend ~/.juliaup/bin

# CUDA
#pathappend /opt/cuda/bin /opt/cuda/nsight_compute /opt/cuda/nsight_systems/bin

# Perl
#pathappend /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl

# Ruby
#pathappend ~/.local/share/gem/ruby/3.0.0/bin

# DOOM Emacs
#pathappend ~/emacs.doom/bin

############
# ENV VARS #
############

# Terminal emulator
#export TERM='rxvt-unicode-256color'
export TERM='linux'
#export TERMINAL='alacritty'

# Text editors
#export EDITOR='nvim'
#export VISUAL='emacsclient -c -a emacs'
# PDF Reader
#export READER='zathura'

# Bat
export BAT_THEME='Dracula'

# Web browser
#export BROWSER='qutebrowser'
#export BROWSERCLI='w3m'

# Set manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# n^3 file manager options
export NNN_OPTS="dEox"

export DATA="/home_tmp/eliseuvf"

###########
# ALIASES #
###########

# Clear screen
alias c='clear'

# Show history
alias h='history -i'

# Changing 'ls' to 'exa'
alias l='exa --group-directories-first --icons --color=always'
alias la='exa --all --group-directories-first --icons --color=always'
alias ll='exa --all --long --header --git --group-directories-first --icons --color=always'
alias lt='exa --all --tree --group-directories-first --icons --ignore-glob=.git --color=always'
alias l.='exa --all | rg "^\."'

# Easier cd
alias ..='cd ..'
alias ~='cd ~'

# Create parent dirs as needed
alias mkdir='mkdir -p'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Use rsync for copying files
alias rs='rsync -Pazvh'
alias rsrm='rsync -Pazvh --remove-source-files'

mvdata() {
    rsync -Pazvh --remove-source-files "$@" "$DATA"
}

# Reset fail lock after failed authentication attempts
alias failreset='faillock --user $USER --reset'

# Grep
alias grep='grep --color'

# Use 'bat' instead of 'cat'
alias b='bat'

# NeoVim
alias v='vim'
#alias lv='lvim'

# tmux
alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'

# Watch with 1s refresh
alias w='watch --color -n 1.0 '

# Resource monitors
alias ht='htop -d5 -sPERCENT_CPU'
#alias gt='gotop -p -r 500ms'
#alias bt='btop'

# stow: never fold
alias stow='stow --no-folding'

# udiskie
#alias ud-umount='udiskie-umount --detach'

# Default git push
alias git-push="git add . && git commit -m 'Lovelace update' && git push"

# n^3 file manager
alias nn="(export VISUAL='vim'; nnn-static)"

# scrot
#alias scrot='scrot ~/Storage/Images/screenshots/%Y-%m-%d_%H:%M:%S.png'

# Weather
alias wttr='curl wttr.in/?0Fq'

# SSH agent restart (temporary)
alias ssh-restart='killall ssh-agent; eval `ssh-agent`; ssh-add'

# SLURM
alias sb='sbatch --time=31-00:00 --nodes=1 --ntasks=1 --partition=long --qos=qos_long'
alias ssqueue='sudo squeue'
alias wsqueue='watch -n 1.0 squeue'
alias wtsqueue='watch -n 1.0 '"'"'squeue | tail -n25'"'"
alias wttsqueue='watch -n 1.0 '"'"'squeue | tail -n109'"'"
alias wssqueue='watch -n 1.0 sudo squeue'
alias pf="ls | sort | fzf --preview='bat {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

# Fuzzy search dir navigation
function fcd {
    cd "$(find ~ -not -path '*/.*' -type d | fzf --height 50% --reverse --preview 'exa -lah {}')" || return
}

# Fuzzy search file in dir and open
function fop {
    local filename=$(find . -type f | fzf --reverse --preview 'bat {} --color always')
    if [ -f "$filename" ]; then
        local filetype=$(xdg-mime query filetype "$filename")
        echo "Opening file " "$filename" " of type " "$filetype" " with " "$(xdg-mime query default $filetype)"
        xdg-open "$filename" &
    fi
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
function fif {
    if [ ! "$#" -gt 0 ]; then
        echo "Need a string to search for!"
        return 1
    fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

#########
# Julia #
#########

# Julia threads
export JULIA_NUM_THREADS=auto

# Julia default editor for the @edit macro
export JULIA_EDITOR=vim

# Update Julia packages
alias julia-update='julia -e "using Pkg; Pkg.update()"'

# Complete Julia update
function juliaupdate {
    printf "\n${BLUE}Updating juliaup...${RESET}\n\n"
    juliaup self update
    printf "\n${BLUE}Updating Julia...${RESET}\n\n"
    juliaup update
    printf "\n${BLUE}Updating Julia environments...${RESET}\n\n"
    julia-update
}

# Julia package manager garbage collection
alias julia-cleanup='juliaup gc; julia -e "using Pkg; Pkg.gc()"'

# Complete Julia cleanup
function juliacleanup {
    printf "\n${BLUE}Cleaning juliaup...${RESET}\n\n"
    juliaup gc
    printf "\n${BLUE}Cleaning Julia environments...${RESET}\n\n"
    julia-cleanup
}

# Queue job
function sbexec {
    sbatch --time=31-00:00 --nodes=1 --ntasks=1 --partition=long --qos=qos_long --wrap="$*"
}

# Queue job that executes julia script
function sbjl {
    sbatch --time=31-00:00 --nodes=1 --ntasks=1 --partition=long --qos=qos_long --wrap="$HOME/.juliaup/bin/julia $*"
}

sbjlargs() {
    printf "\nSubmitting script $1\n\n"
    while IFS= read -r line; do
        printf "Args = $line\n"
        echo "$1 $line"
        sbjl "$1 $line"
    done <<<$(~/.juliaup/bin/julia --startup-file=no "$2")
}

. "$HOME/.cargo/env"
