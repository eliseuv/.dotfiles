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

# Prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set up starship prompt
eval "$(starship init bash)"

# Open at start
neofetch
