# The following lines were added by compinstall

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

zstyle ':completion:*' completer _complete _complete:-fuzzy _correct _approximate _ignored

znap source givensuman/zsh-allclear
znap source Tarrasch/zsh-bd
znap source zshzoo/cd-ls
# path
## both 
GO_PATH="$HOME/go/bin"
## both end

## MacOS
HOMEBREW_BIN_PATH="/opt/homebrew/bin/"
## MacOS end

## Linux
CUDA_PATH="/usr/local/cuda/lib64"
LLAMA_CPP_PATH="/usr/local/llama.cpp/lib64"
ELIXIRLS_PATH="/usr/local/elixirls"
## Linux end

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$HOMEBREW_BIN_PATH:$GO_PATH:$CUDA_PATH:$LLAMA_CPP_PATH:$ELIXIRLS_PATH"
# path end

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

# pnpm
export PNPM_HOME="/home/robertismo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
