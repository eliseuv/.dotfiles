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

# Prepend to PATH if not already there
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

# CUDA
#pathappend /opt/cuda/bin /opt/cuda/nsight_compute /opt/cuda/nsight_systems/bin

# Perl
pathappend /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl

# Ruby
pathappend ~/.local/share/gem/ruby/3.0.0/bin

# DOOM Emacs
pathappend ~/.config/emacs-doom/bin

# Local man
# manpathappend ~/.local/share/man

############
# ENV VARS #
############

# Terminal emulator
# export COLORTERM='truecolor'
#export TERM='rxvt-unicode-256color'
export TERM='xterm-256color'
export TERMINAL='kitty'
# export TERMINAL='alacritty'

# Text editors
export EDITOR='nvim'
export VISUAL='emacsclient -c -a emacs'
# export VISUAL=$EDITOR
# export SUDO_EDITOR=$EDITOR

# DOOM Emacs
export EMACSDIR="$HOME/.config/emacs-doom"
export DOOMDIR="$HOME/.config/doom"

# PDF Reader
export READER='zathura'

# Bat
export BAT_THEME='Dracula'

# Web browser
export BROWSER='firefox'
export BROWSERCLI='w3m'

# Set manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# n^3 file manager options
export NNN_OPTS="dEox"

# Task Spooler
# Mximum number of parallel jobs
export TS_SLOTS=1

# Ada Lovelace cluster
export LOVELACE='lovelace.if.ufrgs.br'
export LOVELACE_DATA="eliseuvf@$LOVELACE:/home_tmp/eliseuvf/"

# hledger
export LEDGER_FILE=~/Documents/finances/home-ledger/home.ledger

# GTK Themo
export GTK_THEME=Adwaita-dark

# Spotify API keys
export $(xargs -d '\n' <"$HOME/Documents/personal/api_keys/spotify.txt")

# npm
# export NODE_OPTIONS='--openssl-legacy-provider'

#############
# GPG + SSH #
#############

# Let GPG manage SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK
fi

# Configure pinentry to use the correct tty
export GPG_TTY=$TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# Launch GPG Agnet
gpgconf --launch gpg-agent

#########
# INPUT #
#########

# Swap Esc and Caps Lock
setxkbmap -option caps:escape

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
# alias l='lsd --group-directories-first --icon=always --color=always --hyperlink=always'
# alias la='lsd --almost-all --group-directories-first --icon=always --color=always --hyperlink=always'
# alias ll="lsd --almost-all --long --header --group-directories-first --icon=always --color=always --hyperlink=always --date '+%Y-%m-%d %H:%M'"
# alias lt='lsd --almost-all --tree --group-directories-first --icon=always --ignore-glob=.git --color=always --hyperlink=always'
# alias l.='lsd --almost-all | rg "^\."'

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

# Kakoune
alias k='kak'

# Helix
alias hx='helix'

# Newsboat
alias nb='newsboat'

# Pulse Mixer
alias pm='pulsemixer'

# Resource monitors
alias ht='htop -d5 -sPERCENT_CPU'
#alias gt='gotop -p -r 500ms'
alias bt='btm'

# n^3 file manager
alias nn="(export VISUAL='nvim'; nnn)"

# scrot
alias scrot='scrot ~/Storage/Images/screenshots/%Y-%m-%d_%H:%M:%S.png'

# Weather
alias wttr="curl 'wttr.in/?2AFQ?M'"

# SciHub to pdf
# https://github.com/dougy147/scitopdf
alias scihub="curl https://raw.githubusercontent.com/dougy147/scitopdf/master/bin/scitopdf | bash -s "

# Convenience aliases

# TLDR
alias tldrf="tldr --list | tr -d \"[''],\" | tr ' ' '\n' | fzf --preview \"tldr {1}\" --preview-window=right,70% | xargs tldr"

# Use rsync for copying files
alias rs='rsync -Pazvhm'
alias rsonly='rsync -Pazvhm -include "*/" --exclude="*"'
alias rsmv='rsync -Pazvhm --remove-source-files'

# Reset fail lock after failed authentication attempts
alias fail-reset='faillock --user $USER --reset'

# udiskie
alias ud-umount='udiskie-umount --detach'
alias ud-mount='udiskie-mount --recursive'

# Use ssh kitten from kitty
# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# SSH agent restart (temporary)
alias ssh-restart='killall ssh-agent; eval `ssh-agent`; ssh-add'

# Disk destroyer
# I always forget the correct flags for writing the image to USB drive
# Usage: disk-destroyer if=/path/to/image.iso of=/dev/sd<?>
alias disk-destroyer='sudo dd bs=4M conv=fsync oflag=direct status=progress'

# Stage, commit and push changes with default commit message
alias git-push="git add . && git commit -m 'update' && git push"

# Connect to UFRGS VPN
alias vpn-ufrgs="sudo openvpn --config ~/.config/openvpn/vpn-ufrgs.ovpn"

# ytfzf
alias yt="ytfzf"

# Spicetify update
alias spicetify-update="spicetify update; spicetify restore backup; spicetify backup apply;"

#############
# FUNCTIONS #
#############

# yazi wrapper
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Print csv file
function pcsv {
    sed 's/,,/, ,/g;s/,,/, ,/g' "$1" | column -s, -t | less -#2 -N -S
}

# ex - archive extractor
# usage: ex <file>
function ex {
    if [ -f "$1" ]; then
        case "$1" in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz) tar xzf "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.rar) unrar x "$1" ;;
        *.gz) gunzip "$1" ;;
        *.tar) tar xf "$1" ;;
        *.tbz2) tar xjf "$1" ;;
        *.tgz) tar xzf "$1" ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# YouTube MP3
function ytmp3 {
    yt-dlp -f 'ba' -x --audio-format mp3 "$1" -o "$HOME/Storage/CompanionCube/music/_unsorted/%(title)s.%(ext)s"
}

# Add spacing left of text
# Pipe to it to to add spacing to the beginning of outpu
# COMMAND | tab
function tab {
    while read -r LINE; do
        echo "${LINE//^/  }"
    done
}

# Cheat sheet
function cheat {
    curl https://cheat.sh/"$*" | bat
}

#######
# fzf #
#######

# fzf ripgrep options
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# fzf theme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Fuzzy search dir navigation
function cdf {
    cd "$(fd --type d --hidden --ignore | fzf --height 50% --reverse --preview 'eza -lah {}')" || return
}

# Fuzzy search file in dir and open
function fop {
    local filename
    filename=$(find . -type f | fzf --reverse --preview 'bat {} --color always')
    if [ -f "$filename" ]; then
        local filetype
        filetype=$(xdg-mime query filetype "$filename")
        echo "Opening file " "$filename" " of type " "$filetype" " with " "$(xdg-mime query default "$filetype")"
        xdg-open "$filename" &
    fi
}

# Search file in dir and open in editor
function f {
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview 'bat {} --color always'))
    [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# Search for string inside files in current dir
function frg {
    if [ ! "$#" -gt 0 ]; then
        # echo "Need a string to search for!"
        return 1
    fi
    FILE=$(rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
    [[ -n "$FILE" ]] && "$EDITOR" "$FILE"
}

# Search music library and add to playlist
function fm {
    local FORMAT="[[%artist% - ]%title%]|[%file%]"
    mpc listall -f "$FORMAT" | fzf --multi --preview 'mediainfo ~/Storage/Music/{}' | mpc add
    mpc play
}

# Kill processes - list only the ones you can kill
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fshow - git commit browser
fshow() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
            --header "enter to view, alt-y to copy hash" \
            --bind "enter:execute:$_viewGitLogLine   | less -R" \
            --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

########
# tmux #
########

alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'

# # t - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# # `t` will allow you to select your tmux session via fzf.
# # `t irc` will attach to the irc session (if it exists), else it will create it.
# t() {
#     [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
#     if [ $1 ]; then
#         tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1")
#         return
#     fi
#     session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && tmux $change -t "$session" || echo "No sessions found."
# }

########
# Rust #
########

# Rust Cargo
#pathappend ~/.cargo/bin
. "$HOME/.cargo/env"

# Rust backtrace
export RUST_BACKTRACE=1
export RUSTC_WRAPPER=sccache

# Update cargo binaries
# https://crates.io/crates/cargo-update
alias cargo-update='cargo install-update --all'

# Cargo cleanup
# https://crates.io/crates/cargo-cache
# Removes crate source checkouts and git repo checkouts
alias cargo-cleanup='cargo cache --autoclean'
# Recompress git repos
alias cargo-gc='cargo cache --gc'
# Cargo clean projects
alias cargo-clean-all='cargo clean-recursive ~/programs/'

function cargocleanup {
    printf "${BLUE}Removing crate source checkouts and git repos checkouts...${RESET}\n"
    cargo-cleanup
    printf "\n${BLUE}Recompressing git repos...${RESET}\n"
    cargo-gc
    # printf "\n${BLUE}Cargo clean on projects...${RESET}\n"
    # cargo-clean-all
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

#########
# Julia #
#########

# Add Julia to path
pathprepend "$HOME/.juliaup/bin"

# Julia threads
export JULIA_NUM_THREADS=auto

# Julia default editor for the @edit macro
export JULIA_EDITOR=nvim

# Enqueue Julia scripts as jobs
jlargs() {
    printf "\nSubmitting script $1\n\n"
    while IFS= read -r line; do
        echo "Args = $line"
        COMMAND="tsp julia $1 $line"
        eval "$COMMAND"
    done <<<"$(julia --startup-file=no "$2")"
}

# Julia with precompiled Revise.jl and OhMyREPL
alias jl='julia --sysimage=/home/evf/.julia/config/sysimages/revise-omr_sysimage.so'

# Update Julia packages
alias julia-env-update='julia -e "using Pkg; Pkg.update()"'

# Complete Julia update
function juliaupdate {
    printf "\n${BLUE}Updating juliaup...${RESET}\n\n"
    juliaup self update
    printf "\n${BLUE}Updating Julia...${RESET}\n\n"
    juliaup update
    printf "\n${BLUE}Updating Julia environments...${RESET}\n\n"
    julia-env-update
}

# Julia package manager garbage collection
alias julia-env-cleanup='julia -e "using Pkg; Pkg.gc()"'

# Complete Julia cleanup
function juliacleanup {
    printf "\n${BLUE}Cleaning juliaup...${RESET}\n\n"
    juliaup gc
    printf "\n${BLUE}Cleaning Julia environments...${RESET}\n\n"
    julia-env-cleanup
}

# Run Julia Pluto
alias pluto-start="julia --eval 'using Pluto ; Pluto.run(launch_browser=false)'"

###########
# Haskell #
###########

# GHCup env
[ -f "/home/evf/.ghcup/env" ] && source "/home/evf/.ghcup/env"

# Add the -dynamic flag to every invocation of GHC
alias cabal-install='cabal install --ghc-options=-dynamic'

#########
# OCaml #
#########

[[ ! -r /home/evf/.opam/opam-init/init.zsh ]] || source /home/evf/.opam/opam-init/init.zsh >/dev/null 2>/dev/null

########
# Lean #
########

export PATH="$HOME/.elan/bin:$PATH"

##########
# Python #
##########

########
# Ruby #
########

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"

pathappend "$GEM_HOME/bin"

#######
# npm #
#######

# export NPM_PACKAGES="$HOME/.npm-packages"
#
# pathappend "$NPM_PACKAGES/bin"
#
# manpathappend "$NPM_PACKAGES/share/man"

##########
# NeoVim #
##########

# NeoVim version multiplexer
pathprepend ~/.local/share/bob/nvim-bin

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

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-erudite="NVIM_APPNAME=EruditeNvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias v='nvim-lazy'
alias vr='nvim-lazy -R'

# LazyVim update
alias nvim-lazy-update="nvim-lazy --headless \"+Lazy! sync\" +qa"

# Use LazyVim as default
export NVIM_APPNAME="LazyVim"

##########
# PACMAN #
##########

# Pacman mirrors
# alias mirror="sudo reflector --verbose --protocol https --latest 50 --number 20 --country 'Brazil,Chile,US,' --sort rate --save /etc/pacman.d/mirrorlist"
alias mirrorr='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

function mirror {
    local TMPFILE
    TMPFILE="$(mktemp)"
    sudo true
    rate-mirrors --save="$TMPFILE" arch --max-delay=43200
    sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
    sudo mv "$TMPFILE" /etc/pacman.d/mirrorlist
}

# Pacman
# Fuzzy search on available packages and install
function pac {
    pacman -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'pacman -Sii {1}' --reverse | tr -d '*' | xargs -ro sudo pacman -S
}
# Fuzzy search on installed packacges and remove
alias pacremove="pacman -Qettq | fzf --multi --preview 'pacman -Qii {1}' --reverse | xargs -ro sudo pacman -Rns"
# Update all packages
alias pacsyu='sudo pacman -Syu'
# Remove lock
alias pacunlock='sudo rm /var/lib/pacman/db.lck'

function pacupdate {
    printf "\n${BLUE}Pacman update...${RESET}\n\n"
    pacsyu --noconfirm
}

# paru
# Fuzzy search on available packages and install
function par {
    paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'paru -Si {1}' --reverse | tr -d '*' | xargs -ro paru -S
}
# Fuzzy search on installed packacges and remove
alias parremove="paru -Qeq | fzf --multi --preview 'paru -Qi {1}' --reverse| xargs -ro paru -Rns"
# Update all packacges (standard and AUR)
alias parsyu='paru -Syu'
# Update AUR packages
alias parsua='paru -Sua'

function parupdate {
    printf "\n${BLUE}Pacman + AUR update...${RESET}\n\n"
    parsyu --noconfirm
    printf "\n${BLUE}Detecting necessary rebuilds...${RESET}\n\n"
    checkrebuild -v
}

# Pacman cleanup
function paccleanup {
    printf "\n${BLUE}Pacman cache cleanup...${RESET}\n\n"
    paccache -rk1
    paccache -ruk0
    printf "\n${BLUE}Paru AUR cache cleanup...${RESET}\n\n"
    paru -Scca --noconfirm
    printf "\n${BLUE}Removing orphaned packages...${RESET}\n\n"
    pacman -Qdtq | xargs -ro sudo pacman -Rns --noconfirm
}

#######################
# Systemwide Commands #
#######################

# Update system
function update {
    local LOCK_FILE=/tmp/update.lock
    if [ -f "$LOCK_FILE" ]; then
        printf "${RED}Error: Lock file $LOCK_FILE found. ${RESET}\n"
        return 1
    fi
    touch "$LOCK_FILE"
    printf "\n${GREEN}Updating Arch...${RESET}\n\n"
    parupdate
    printf "\n${GREEN}Updating xmonad...${RESET}\n\n"
    update-xmonad
    printf "\n${GREEN}Updating Rust...${RESET}\n\n"
    rustup update
    printf "\n${GREEN}Updating Cargo bins...${RESET}\n\n"
    cargo-update
    printf "\n${GREEN}Updating Go bins...${RESET}\n\n"
    go-update
    printf "\n${GREEN}Updating Julia...${RESET}\n\n"
    juliaupdate
    printf "\n${GREEN}Updating NeoVim...${RESET}\n\n"
    bob update --all
    nvim-lazy-update
    printf "\n${GREEN}Updating DOOM Emacs...${RESET}\n\n"
    doom upgrade --force --verbose
    printf "\n${GREEN}Custom check...${RESET}\n"
    customcheck
    printf "\n"
    rm -f /tmp/update.lock
}

# Cleanup
function cleanup {
    printf "\n${GREEN}Pacman cleanup...${RESET}\n"
    paccleanup
    printf "\n${GREEN}Julia cleanup...${RESET}\n\n"
    juliacleanup
    printf "\n${GREEN}Cargo cleanup...${RESET}\n\n"
    cargocleanup
    printf "\n${GREEN}Go cleanup...${RESET}\n\n"
    gocleanup
    printf "\n${GREEN}DOOM cleanup...${RESET}\n\n"
    doom gc --force --verbose
}

function customcheck {
    printf "\n  ${GREEN}✓ ${BLUE}No custom checks${RESET}\n"

    # printf "\n${BLUE}Checking if Emacs with native compilation is available...${RESET}\n"
    # pacman -Si emacs-nativecomp
}

# Update and cleanup
alias up='update'
