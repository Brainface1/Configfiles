# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path+=('/home/julius/.local/bin')
export PATH
export MANPAGER="nvim -c 'set ft=man' -"
export EDITOR=nvim
export SHELL=/bin/zsh



# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/julius/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=4000
SAVEHIST=4000
setopt appendhistory nomatch
setopt inc_append_history
setopt share_history
unsetopt autocd beep
setopt globdots
bindkey -v
bindkey "^?" backward-delete-char
bindkey "" backward-delete-char
bindkey "" backward-delete-word
# End of lines configured by zsh-newuser-install


alias zshrc="nvim ~/.zshrc"
alias ls=lsd
alias ys="yadm status"
alias yp="yadm pull"
alias lsa="lsd -a"
alias vim=nvim
alias shutdown="sudo shutdown now"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias k=kubectl
alias t='terraform'
alias cdd="cd ~/Downloads/"
alias cdp="cd ~/Projects/"
alias gs="git status"
alias cd="bettercd"
alias ssp="ssh -X plexus"
alias cdcp="cd ~/Projects/currentproject/"
alias rangerrc="vim ~/.config/ranger/rc.conf"
alias sxhkdrc="vim ~/.config/sxhkd/sxhkdrc"

# User configuration
source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60


# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

zplug romkatv/powerlevel10k, as:theme, depth:1

# Then, source plugins and add commands to $PATH
zplug load

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

bindkey -s '^o' 'ranger-cd\n'

function bettercd {
	builtin cd "$@"
	ls
}

function backup {
	yadm pull
	yadm add ~/*
	yadm add -u
	yadm commit -m "$1"
	yadm push
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
