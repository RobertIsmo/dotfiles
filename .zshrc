# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/robertismo/.zshrc'
zstyle ':autocomplete:*' add-space

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh

alias ls="eza --icons=always"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
znap prompt romkatv/powerlevel10k

ZSH_AUTOSUGGEST_STRATEGY=(completion history)
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source marlonrichert/zsh-autocomplete
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select

znap source givensuman/zsh-allclear
znap source Tarrasch/zsh-bd
