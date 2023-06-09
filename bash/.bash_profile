#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc
. ~/.profile
. ~/.bashrc
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
