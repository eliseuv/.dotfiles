#!/bin/bash

# Profile with environment variables and aliases

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
pathappend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

# System binaries
pathappend /bin /usr/bin /usr/local/bin /usr/local/sbin

# CUDA
#pathappend /opt/cuda/bin /opt/cuda/nsight_compute /opt/cuda/nsight_systems/bin

# Perl
pathappend /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl

# Ruby
pathappend ~/.local/share/gem/ruby/3.0.0/bin

# DOOM Emacs
pathappend ~/.emacs.doom/bin

# Custom scripts
pathappend ~/.local/bin ~/.scripts

############
# ENV VARS #
############

# Terminal emulator
#export TERM='rxvt-unicode-256color'
export TERM='alacritty'

# Text editors
export EDITOR='nvim'
export VISUAL='emacsclient -c -a emacs'
# PDF Reader
export READER='zathura'

# Bat
export BAT_THEME='Dracula'

# Web browser
export BROWSER='qutebrowser'
export BROWSERCLI='w3m'

# Set manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Rust backtrace
export RUST_BACKTRACE=1

# n^3 file manager options
export NNN_OPTS="dEox"

# fzf dracula colortheme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

#######
# GPG #
#######

# GPG SSH keys
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

#########
# INPUT #
#########

# Swap Esc and Caps Lock
setxkbmap -option caps:swapescape

###########
# ALIASES #
###########

# Clear screen
alias c='clear'

# Show history
alias h='history -i'

# Changing 'ls' to 'exa'
alias l='exa --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -lah --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | rg "^\."'

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

# Reset fail lock after failed authentication attempts
alias failreset='faillock --user $USER --reset'

# Grep
alias grep='grep --color'

# Use 'bat' instead of 'cat'
alias b='bat'

# NeoVim
alias v='nvim'
alias lv='lvim'

# Kakoune
alias k='kak'

# Newsboat
alias nb='newsboat'

# Pulse Mixer
alias pm='pulsemixer'

# Watch with 1s refresh
alias watch='watch -tc -n 1'

# Resource monitors
alias ht='htop -d5 -sPERCENT_CPU'
#alias gt='gotop -p -r 500ms'
alias bt='btop'

# stow: never fold
alias stow='stow --no-folding'

# udiskie
alias ud-umount='udiskie-umount --force --detach'

# n^3 file manager
alias nn="(export VISUAL='nvim'; nnn)"

# scrot
alias scrot='scrot ~/Storage/Images/screenshots/%Y-%m-%d_%H:%M:%S.png'

# Weather
alias wttr='curl wttr.in/?0Fq'

# SSH agent restart (temporary)
alias ssh-restart='killall ssh-agent; eval `ssh-agent`; ssh-add'

#############
# FUNCTIONS #
#############

# Fuzzy search dir navigation
fcd() {
    cd "$(find ~ -not -path '*/.*' -type d | fzf --height 50% --reverse --preview 'exa -lah {}')" || return
}

# Fuzzy search file in dir and open
fop() {
    filename=$(find . -type f | fzf --reverse --preview 'bat {} --color always')
    if [ -f "$filename" ]; then
        filetype=$(xdg-mime query filetype "$filename")
        echo "Opening file " "$filename" " of type " "$filetype" " with " "$(xdg-mime query default $filetype)"
        xdg-open "$filename" &
    fi
}

# Print csv file
pcsv() {
    sed 's/,,/, ,/g;s/,,/, ,/g' "$1" | column -s, -t | less -#2 -N -S
}

# ex - archive extractor
# usage: ex <file>
ex() {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Fuzzy search music library
fmp() {
    FORMAT="[%file%]"
    mpc listall -f $FORMAT | fzf --multi --preview 'mediainfo ~/Storage/Music/{}' | mpc add
}

# YouTube MP3
ytmp3() {
    yt-dlp -f 'ba' -x --audio-format mp3 $1 -o '$HOME/Storage/Music/_unsorted/%(title)s.%(ext)s'
}

#########
# Julia #
#########

# Julia threads
export JULIA_NUM_THREADS=auto

# Julia default editor for the @edit macro
export JULIA_EDITOR=nvim

# Julia with precompiled Revise.jl and OhMyREPL
alias jl='julia --sysimage=/home/evf/.julia/config/sysimages/revise-omr_sysimage.so'

# Update Julia packages
alias julia-update='julia -e "using Pkg; Pkg.update()"'

# Julia package manager garbage collection
alias julia-cleanup='julia -e "using Pkg; Pkg.gc()"'

#############
# MINICONDA #
#############

# Conda profile
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Conda directories
export CONDA_BASE_DIR="/opt/miniconda3"
export CONDA_ENVS_DIR="$HOME/.conda/envs"

# Activate an env (with fzf)
condaenv() {
  ENVS_LIST=("base")
  ENVS_LIST+=$(ls $CONDA_ENVS_DIR)
  conda activate $(printf "%s\n" ${ENVS_LIST[@]} | fzf)
}

# List explicitly installed packages
alias conda-list='conda env export --from-history'

condaupdate() {
    printf "${BLUE}Updating base env...${RESET}\n"
    conda activate base
    sudo conda update --all --yes
    conda deactivate
    ENVS=`ls $CONDA_ENVS_DIR`
    for ENV in ${ENVS[@]}
    do
        printf "${BLUE}Updating $ENV env...${RESET}\n"
        conda activate $ENV
        conda upgrade --all --yes
        conda deactivate
    done
}

condacleanup() {
    printf "${BLUE}Cleaning up base env...${RESET}\n"
    conda activate base
    sudo conda clean --all --yes
    conda deactivate
    ENVS=`ls $CONDA_ENVS_DIR`
    for ENV in ${ENVS[@]}
    do
        printf "\n${BLUE}Cleaning up $ENV env...${RESET}\n"
        conda activate $ENV
        conda clean --all --yes
        conda deactivate
    done
}

####################
# PACKAGE MANPAGER #
####################

# Pacman mirrors
alias mirror='sudo reflector --verbose --protocol https --latest 50 --number 20 --country Brazil --country Chile --country US --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrorr='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --verbose --protocol https --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'

# Pacman
# Fuzzy search on available packages and install
alias pac="pacman -Sl | awk '{print \$2(\$4==\"\" ? \"\" : \" *\")}' | fzf --multi --preview 'pacman -Sii {1}' --reverse | xargs -ro sudo pacman -S"
# Fuzzy search on installed packacges and remove
alias pacremove="pacman -Qettq | fzf --multi --preview 'pacman -Qii {1}' --reverse | xargs -ro sudo pacman -Rns"
# Update all packages
alias pacsyu='sudo pacman -Syu --noconfirm'
# Remove lock
alias pacunlock='sudo rm /var/lib/pacman/db.lck'

# paru
# Fuzzy search on available packages and install
alias par="paru -Sl | awk '{print \$2(\$4==\"\" ? \"\" : \" *\")}' | fzf --multi --preview 'paru -Si {1}' --reverse | xargs -ro paru -S"
# Fuzzy search on installed packacges and remove
alias parremove="paru -Qeq | fzf --multi --preview 'paru -Qi {1}' --reverse| xargs -ro paru -Rns"
# Update all packacges (standard and AUR)
alias parsyu='paru -Syu --noconfirm'
# Update AUR packages
alias parsua='paru -Sua --noconfirm'

# Pacman cleanup
paccleanup() {
    printf "\n${BLUE}Pacman cache cleanup...${RESET}\n"
    paccache -rk1
    paccache -ruk0
    printf "\n${BLUE}Paru AUR cache cleanup...${RESET}\n"
    paru -Scca --noconfirm
    printf "\n${BLUE}Removing orphaned packages...${RESET}\n"
    pacman -Qdtq | xargs -ro sudo pacman -Rns --noconfirm
}

# Upgrade system
update() {
    printf "\n${GREEN}Updating system...${RESET}\n\n"
    parsyu
    printf "\n${GREEN}Updating Rust...${RESET}\n\n"
    rustup update --no-self-update
    printf "\n${GREEN}Updating Julia...${RESET}\n\n"
    julia-update
    printf "\n${GREEN}Updating Anaconda...${RESET}\n\n"
    condaupdate
    printf "\n${GREEN}Updating DOOM Emacs...${RESET}\n\n"
    doom --yes upgrade
    printf "\n"
}

# Cleanup
cleanup() {
    printf "\n${GREEN}System cleanup...${RESET}\n"
    paccleanup
    printf "\n${GREEN}Julia cleanup...${RESET}\n\n"
    julia-cleanup
    printf "\n${GREEN}Anaconda cleanup...${RESET}\n\n"
    condacleanup
    printf "\n${GREEN}DOOM purge...${RESET}\n\n"
    doom purge
}

customcheck() {
  printf "\n${GREEN}No custom checks${RESET}\n"

  # printf "\n${GREEN}Custom check...${RESET}\n"
  # printf "\n${BLUE}Checking if Emacs with native compilation is available...${RESET}\n"
  # pacman -Si emacs-nativecomp
}

# Update and cleanup
alias up='update;cleanup;customcheck'
