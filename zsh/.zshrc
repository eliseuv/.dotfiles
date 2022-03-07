# ZSH config file

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

# Import variables and aliases from ~/.profile
source ~/.profile

# History
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set Vi mode
bindkey -v

# Prompt (commented out if using starship prompt)
#PROMPT=%F{green}%n%f@%F{green}%m%f$' | '%F{yellow}%d%f%F{green}$'\n> '%f
# Set up starship prompt
eval "$(starship init zsh)"

# Open at start
neofetch --color_blocks off
