# Path
export PATH=~/bin:$PATH

# Aliases
alias v='vim'
alias ll='exa -lgah'
alias ..='cd ..'
alias ~='cd ~'
alias c='clear'
alias nn='nnn-static -deo'
alias b='~/bin/bat'
alias sb='sbatch --time=31-00:00 --nodes=1 --ntasks=1 --partition=long --qos=qos_long'
alias ssqueue='sudo squeue'
alias w='watch -n 1.0'
alias wsqueue='watch -n 1.0 squeue'
alias wtsqueue='watch -n 1.0 '"'"'squeue | tail -n25'"'"
alias wttsqueue='watch -n 1.0 '"'"'squeue | tail -n115'"'"
alias wssqueue='watch -n 1.0 sudo squeue'
alias pf="ls | sort | fzf --preview='bat {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

# Fuzzy search and change dir
fcd() {
    cd "$(find ~ -not -path '*/.*' -type d | fzf --height 50% --reverse --preview 'exa -lah {}')"
}

# Fuzzy search current dir and open text file
fop() {
    filename=`find . -type f -not -path '*/.*' | fzf --reverse --preview '~/bin/baat {} --color always'`
    [[ -f $filename ]] && vim $filename
}

# Queue job that executes julia script
sbjl() {
sbatch --time=31-00:00 --nodes=1 --ntasks=1 --partition=long --qos=qos_long --wrap="$HOME/.juliaup/bin/julia $@"
}

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in *:/home/eliseuvf/.juliaup/bin:*);; *)
    export PATH=/home/eliseuvf/.juliaup/bin${PATH:+:${PATH}};;
esac

# <<< juliaup initialize <<<
