# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

if uwsm check may-start && uwsm select; then
    exec uwsm start default
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined"

ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting fast-syntax-highlighting zsh-autosuggestions pip rust sudo)

source $ZSH/oh-my-zsh.sh

export SAMBANOVA_API_KEY=""
export MISTRAL_API_KEY=""
export CODESTRAL_API_KEY=""
export GITHUB_API_KEY=""   
export OPENROUTER_API_KEY=""
export HUGGINGFACE_API_KEY=""

fastfetch
