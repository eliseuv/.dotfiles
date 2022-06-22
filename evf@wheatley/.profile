# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

########
# PATH #
########

# Append to PATH if not already there
function pathappend {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

# System binaries
pathappend /bin /usr/bin /usr/local/bin /usr/local/sbin

# Custom scripts
pathappend ~/.local/bin

# CUDA
#pathappend /opt/cuda/bin /opt/cuda/nsight_compute /opt/cuda/nsight_systems/bin

# Perl
#pathappend /usr/bin/core_perl /usr/bin/site_perl /usr/bin/vendor_perl

# Ruby
#pathappend ~/.local/share/gem/ruby/3.0.0/bin

# DOOM Emacs
pathappend ~/.config/emacs/bin


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in *:/home/evf/.juliaup/bin:*);; *)
    export PATH=/home/evf/.juliaup/bin${PATH:+:${PATH}};;
esac

# <<< juliaup initialize <<<

. "$HOME/.cargo/env"

# Swap ESC and CAPS LOCK
setxkbmap -option caps:swapescape

# Aliases
alias c='clear'
alias ..='cd ..'
alias ~='cd ~'
alias b='batcat'
alias bt='bpytop'
alias v='lvim'
alias l='exa --color=always --all'
alias ll='exa --color=always --all --long --header'
alias lt='exa --color=always --all --tree'
