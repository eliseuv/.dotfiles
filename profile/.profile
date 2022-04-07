# Profile with environment variables and aliases

##########
# COLORS #
##########

# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

############
# ENV VARS #
############

# Path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.local/share/gem/ruby/3.0.0/bin:~/.local/bin:~/.emacs.doom/bin:~/.scripts

# Terminal emulator
#export TERM='rxvt-unicode-256color'
export TERM='alacritty'

# Text editors
export EDITOR='lvim'                    # LunarVim as terminal editor
export VISUAL='emacsclient -c -a emacs' # Emacs as GUI editor

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
alias rsm='rsync -Pazvh --remove-source-files'

# Reset fail lock after failed authentication attempts
alias failreset='faillock --user $USER --reset'

# Grep
alias grep='grep --color'

# Use 'bat' instead of 'cat'
alias b='bat'

# NeoVim
alias v='lvim'

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
alias udm='udiskie-umount --force --detach'

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

# Julia with precompiles OhMyREPL
alias jl='julia --sysimage=/home/evf/.julia/config/sysimages/revise-omr-sysimage.so'

# Update Julia packages
alias julia-update='julia -e "using Pkg; Pkg.update()"'

# Julia package manager garbage collection
alias julia-cleanup='julia -e "using Pkg; Pkg.gc()"'

############
# ANACONDA #
############

# Activate an environment
alias conda-activate='source /opt/anaconda/bin/activate'

# List explicitly installed packages
alias conda-list='conda env export --from-history'

condaupdate() {
    printf "${blue}Updating base env...${reset}\n"
    conda-activate base
    sudo conda upgrade --all --yes
    conda deactivate
    envs=`ls ~/.conda/envs`
    for env in ${envs[@]}
    do
        printf "${blue}Updating $env env...${reset}\n"
        conda-activate $env
        conda upgrade --all --yes
        conda deactivate
    done
}

condacleanup() {
    printf "${blue}Cleaning up base env...${reset}\n"
    conda-activate base
    sudo conda clean --all --yes
    conda deactivate
    envs=`ls ~/.conda/envs`
    for env in ${envs[@]}
    do
        printf "\n${blue}Cleaning up $env env...${reset}\n"
        conda-activate $env
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
    printf "\n${green}Pacman cleanup...${reset}\n"
    printf "\n${blue}Pacman cache cleanup...${reset}\n"
    paccache -rk1
    paccache -ruk0
    printf "\n${blue}Paru AUR cache cleanup...${reset}\n"
    paru -Scca --noconfirm
    printf "\n${blue}Removing orphaned packages...${reset}\n"
    pacman -Qdtq | xargs -ro sudo pacman -Rns --noconfirm
}

# Upgrade system
update() {
    printf "\n${green}Updating system...${reset}\n\n"
    parsyu
    printf "\n${green}Updating Rust...${reset}\n\n"
    rustup update --no-self-update
    printf "\n${green}Updating Julia...${reset}\n\n"
    julia-update
    printf "\n${green}Updating Anaconda...${reset}\n\n"
    condaupdate
    printf "\n${green}Updating DOOM Emacs...${reset}\n\n"
    doom --yes upgrade
    printf "\n"
}

# Cleanup
cleanup() {
    paccleanup
    printf "\n${green}Julia cleanup...${reset}\n\n"
    julia-cleanup
    printf "\n${green}Anaconda cleanup...${reset}\n\n"
    condacleanup
    printf "\n${green}DOOM purge...${reset}\n\n"
    doom purge
}

# Update and cleanup
alias up='update;cleanup'
