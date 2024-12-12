#!/bin/bash

# Profile with environment variables and aliases

# Ignore errors related to unused variables and printf escape sequences
# shellcheck disable=SC2034,SC2059

##########
# COLORS #
##########

# ANSI color code variables
RESET="\e[0m"
RED="\e[0;91m"
BLUE="\e[0;94m"
GREEN="\e[0;92m"
WHITE="\e[0;97m"
BOLD="\e[1m"
ULINE="\e[4m"
EXPAND_BG="\E[K"
RED_BG="\e[0;101m${EXPAND_BG}"
GREEN_BG="\e[0;102m${EXPAND_BG}"
BLUE_BG="\e[0;104m${EXPAND_BG}"

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

# Append to PATH if not already there
function pathprepend {
    for ARG in "$@"; do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="$ARG${PATH:+":$PATH"}"
        fi
    done
}

# Append to MANPATH if not already there
function manpathappend {
    for ARG in "$@"; do
        if [ -d "$ARG" ] && [[ ":$MANPATH:" != *":$ARG:"* ]]; then
            MANPATH="${MANPATH:+"$MANPATH:"}$ARG"
        fi
    done
}

# System binaries
pathappend /bin /usr/bin /usr/local/bin /usr/local/sbin

# Custom scripts
pathprepend ~/.local/bin
pathprepend ~/bin

# Local man
manpathappend ~/.local/share/man

############
# ENV VARS #
############

# Terminal emulator
#export TERM='rxvt-unicode-256color'
# export COLORTERM='truecolor'
# export TERM='xterm-256color'
export TERM='alacritty'
export TERMINAL='alacritty'

# Text editors
export EDITOR='nvim'
# export VISUAL='emacsclient -c -a emacs'

# Bat
export BAT_THEME='Dracula'

# Set manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# n^3 file manager options
export NNN_OPTS="dEox"

# Task Spooler
# Mximum number of parallel jobs
export TS_SLOTS=1

###########
# ALIASES #
###########

# Clear screen
alias c='clear'

# Show history
alias h='history -i'

# Changing 'ls' to 'lsd'
alias l='eza --group-directories-first --icons --color=always'
alias la='eza --all --group-directories-first --icons --color=always'
alias ll='eza --all --long --header --git --group-directories-first --icons --color=always'
alias lt='eza --all --tree --group-directories-first --icons --ignore-glob=.git --color=always'
alias llt='eza --all --long --header --tree --git --group-directories-first --icons --ignore-glob=.git --color=always'
alias l.='eza --all | rg "^\."'

# Easier cd
alias ..='cd ..'
alias ~='cd ~'

# Create parent dirs as needed
alias mkdir='mkdir -p'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Grep
alias grep='grep --color'

# stow
alias stow='stow --no-folding'

# Watch with 1s refresh
# The whitespace at the end is important as it triggers alias substitution
alias watch='watch -tc -n 1 '

# Use 'bat' instead of 'cat'
alias b='bat'

########
# tmux #
########

alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'

# NeoVim
alias v='nvim'

# Resource monitors
alias ht='htop -d5 -sPERCENT_CPU'
#alias gt='gotop -p -r 500ms'
alias bt='btm'

# n^3 file manager
alias nn="(export VISUAL='vim'; nnn)"

# TLDR
alias tldrf="tldr --list | tr -d \"[''],\" | tr ' ' '\n' | fzf --preview \"tldr {1}\" --preview-window=right,70% | xargs tldr"

# Use rsync for copying files
alias rs='rsync -Pazvhm'
alias rsonly='rsync -Pazvhm -include "*/" --exclude="*"'
alias rsmv='rsync -Pazvhm --remove-source-files'

# udiskie
alias ud-umount='udiskie-umount --detach'
alias ud-mount='udiskie-mount --recursive'

# SSH agent restart (temporary)
alias ssh-restart='killall ssh-agent; eval `ssh-agent`; ssh-add'

# Stage, commit and push changes with default commit message
alias git-push="git add . && git commit -m 'update' && git push"

############
# Keyboard #
############

setxkbmap -option caps:escape

########
# Rust #
########

# Rust Cargo
#pathappend ~/.cargo/bin
. "$HOME/.cargo/env"

# Rust backtrace
export RUST_BACKTRACE=1
# export RUSTC_WRAPPER=~/.cargo/bin/sccache

# Update cargo binaries
# https://crates.io/crates/cargo-update
alias cargo-update='cargo install-update --all'

# Cargo cleanup
# https://crates.io/crates/cargo-cache
# Removes crate source checkouts and git repo checkouts
alias cargo-cleanup='cargo cache --autoclean'
# Recompress git repos
alias cargo-gc='cargo cache --gc'

function cargocleanup {
    printf "${BLUE}Removing crate source checkouts and git repos checkouts...${RESET}\n"
    cargo-cleanup
    printf "\n${BLUE}Recompressing git repos...${RESET}\n"
    cargo-gc
}

######
# Go #
######

# Go path
export GOPATH=$HOME/.go

# Go binaries
export GOBIN=$GOPATH/bin

# Go Programs
pathappend "$GOBIN"

# Update binaries obtained by 'go install'
# https://github.com/nao1215/gup
alias go-update='gup update'

function gocleanup {
    printf "${BLUE}Removing build cache...${RESET}\n"
    go clean -cache
    printf "\n${BLUE}Removing module download cache...${RESET}\n"
    go clean -modcache
}

###########
# Haskell #
###########

# GHCup env
[ -f "/home/evf/.ghcup/env" ] && source "/home/evf/.ghcup/env"

# Add the -dynamic flag to every invocation of GHC
alias cabal-install='cabal install --ghc-options=-dynamic'

##########
# NeoVim #
##########

# NeoVim version multiplexer
pathappend ~/.local/share/bob/nvim-bin

# NeoVim config switcher
function nvims() {
    items=("LazyVim" "EruditeNvim" "AstroNvim" "NvChad" "default")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME=$config nvim "$@"
}

# NeoVim
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-erudite="NVIM_APPNAME=EruditeNvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias v='nvim-lazy'
alias vr='nvim-lazy -R'

#######
# APT #
#######

# Pacman
# Fuzzy search on available packages and install
alias apts="apt search . | rg \^\\\\w\+\.\*/ | awk -F/ '{print \$1}' | fzf --multi --preview 'nala show {1}' --reverse | xargs -ro sudo nala install"
# Fuzzy search on installed packacges and remove
alias aptremove="apt list --installed | rg \^\\\\w\+\.\*/ | awk -F/ '{print \$1}' | fzf --multi --preview 'nala show {1}' --reverse | xargs -ro sudo nala purge"

# Ubuntu cleanup
function ubuntucleanup {
    printf "\n${BLUE}Removing orphaned packages...${RESET}\n\n"
    #sudo apt autoremove --purge --yes
    sudo nala autopurge
    printf "\n${BLUE}Cleaning packages and install scripts...${RESET}\n\n"
    #sudo apt clean --yes
    sudo nala clean
}

#######################
# Systemwide Commands #
#######################

# Update system
function update {
    [[ -f /tmp/update.lock ]] && exit 1
    touch /tmp/update.lock
    printf "\n${GREEN}Updating Ubuntu...${RESET}\n\n"
    #sudo apt update --yes && sudo apt upgrade --yes
    sudo nala upgrade
    printf "\n${GREEN}Updating Rust...${RESET}\n\n"
    rustup update
    printf "\n${GREEN}Updating Cargo bins...${RESET}\n\n"
    cargo-update
    printf "\n${GREEN}Updating Go bins...${RESET}\n\n"
    go-update
    printf "\n${GREEN}Updating NeoVim...${RESET}\n\n"
    bob update --all
    # printf "\n${GREEN}Custom check...${RESET}\n"
    # customcheck
    printf "\n"
    rm -f /tmp/update.lock
}

# Cleanup
function cleanup {
    printf "\n${GREEN}Ubuntu cleanup...${RESET}\n"
    ubuntucleanup
    printf "\n${GREEN}Cargo cleanup...${RESET}\n\n"
    cargocleanup
    printf "\n${GREEN}Go cleanup...${RESET}\n\n"
    gocleanup
}

function customcheck {
    printf "\n  ${GREEN}✓ ${BLUE}No custom checks${RESET}\n"

    # printf "\n${BLUE}Checking if Emacs with native compilation is available...${RESET}\n"
    # pacman -Si emacs-nativecomp
}

# Update and cleanup
alias up='update'
